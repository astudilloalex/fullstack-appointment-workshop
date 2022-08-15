import 'package:appointment_project_siprok/src/ui/pages/workshop_appointment/workshop_appointment_controller.dart';
import 'package:appointment_project_siprok/src/ui/utilities/screen_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepInfoContainer extends StatelessWidget {
  const StepInfoContainer({
    super.key,
    required this.currentIndex,
    this.description = '',
  });

  final int currentIndex;
  final String description;

  @override
  Widget build(BuildContext context) {
    const Color selectedColor = Color(0xFF344149);
    const Color unselectedColor = Colors.white;
    final bool phone = MediaQuery.of(context).size.width <
        ScreenInfo.instance.changePoints.desktopChangePoint;
    return SizedBox(
      height: phone ? 50.0 : 63.0,
      child: GetBuilder<WorkshopAppointmentController>(
        builder: (controller) {
          final bool selected = currentIndex == controller.currentPage;
          return CustomPaint(
            painter: _CustomPainter(
              color: const Color(0xFF344149),
              first: currentIndex == 0,
              last: currentIndex == controller.totalPages - 1,
              phone: phone,
              previous: currentIndex - 1 < controller.currentPage,
              selected: selected,
            ),
            child: Padding(
              padding: EdgeInsets.only(right: selected ? 10.0 : 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${'step'.tr} ${currentIndex + 1}',
                    style: TextStyle(
                      color: !selected ? selectedColor : unselectedColor,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      color: !selected ? selectedColor : unselectedColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CustomPainter extends CustomPainter {
  const _CustomPainter({
    required this.color,
    required this.first,
    required this.last,
    required this.phone,
    required this.previous,
    required this.selected,
  });

  final Color color;
  final bool first;
  final bool last;
  final bool phone;
  final bool previous;
  final bool selected;

  @override
  void paint(Canvas canvas, Size size) {
    // Define the paint colors and style.
    final Paint paint = Paint();
    paint.color = selected ? color : color.withOpacity(0.10);
    paint.strokeWidth = selected ? 1.0 : 1.5;
    paint.style =
        selected || previous ? PaintingStyle.fill : PaintingStyle.stroke;
    // Use path to draw.
    final Path path = Path();
    path.lineTo(size.width * (last || phone ? 1.0 : 0.92), 0.0);
    path.lineTo(size.width, size.height * 0.50);
    path.lineTo(size.width * (last | phone ? 1.0 : 0.92), size.height);
    path.lineTo(0, size.height);
    if (!first) {
      path.lineTo(-size.width * 0.08, size.height);
      path.lineTo(0, size.height * 0.50);
      path.lineTo(-size.width * 0.08, 0);
    }
    path.close();
    // Draw in canvas.
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
