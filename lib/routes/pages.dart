import 'package:get/get.dart';
import 'package:project_template/app/modules/home/binding.home.dart';
import 'package:project_template/app/modules/home/page.home.dart';
part 'routes.dart';

List<GetPage> routes = [
  GetPage(
    name: Routes.HOME, 
    page: () => const HomeScreen(),
    binding: HomeBinding()
  )
];