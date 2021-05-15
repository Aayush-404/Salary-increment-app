//TODO:                    imports

//TODO                List of employees

//TODO:               Stream controllers

//TODO               Stream Sink getter

//TODO               Constructor-add data; Listen to changes

//TODO                  CORE FUNCTION

//TODO                    DISPOSE

import 'dart:async';
import 'employee.dart';

class EmployeeBloc {
  List<Employee> _employeeList = [
    Employee(1,"Employee one", 200000.0),
    Employee(2,"Employee two", 250000.0),
    Employee(3,"Employee three", 300000.0),
    Employee(4,"Employee four", 250000.0),
    Employee(5,"Employee five", 200000.0)
  ];

  final _employeeListStreamController = StreamController<List<Employee>>();

  // increment and decrement controllers
  final _employeeSalaryIncrementController = StreamController<Employee>();
  final _employeeSalaryDecrementController = StreamController<Employee>();

  //Getter
   Stream<List<Employee>> get employeeListStream =>
      _employeeListStreamController.stream;
   StreamSink<List<Employee>> get employeeListSink =>
      _employeeListStreamController.sink;
  StreamSink<Employee> get employeeSalaryIncrement =>
      _employeeSalaryIncrementController.sink;
  StreamSink<Employee> get employeeSalaryDecrement =>
      _employeeSalaryDecrementController.sink;

  EmployeeBloc(){
    _employeeListStreamController.add(_employeeList);
    _employeeSalaryIncrementController.stream.listen(_incrementSalary);
    _employeeSalaryDecrementController.stream.listen(_decrementSalary);
  }

  _incrementSalary(Employee employee){
    double salary = employee.salary;
    double incrementedSalary = salary * 20/100;
    _employeeList[employee.id-1].salary = salary + incrementedSalary;
    employeeListSink.add(_employeeList);
  }
  _decrementSalary(Employee employee){
    double salary = employee.salary;
  double decrementedSalary = salary * 20/100;
  _employeeList[employee.id-1].salary = salary - decrementedSalary;
  employeeListSink.add(_employeeList);
  }

  void dispose(){
    _employeeListStreamController.close();
    _employeeSalaryIncrementController.close();
    _employeeSalaryDecrementController.close();
  }

}