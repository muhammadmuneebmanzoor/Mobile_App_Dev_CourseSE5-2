class Shape {
  void area() {
    print("Area");
  }
  void circumference() {
    print("Circumference");
  }
}
class Circle extends Shape {
  double radius;
  Circle(this.radius) : super();
  @override
  void area() {
    print("Area = ${3.14 * radius * radius}");
  }
  @override
  void circumference() {
    print("Circumference = ${2 * 3.14 * radius}");
  }
}
void main() {
  Circle c = Circle(5);
  c.area();
  c.circumference();
}