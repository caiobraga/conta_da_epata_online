import 'package:conta_da_epata_online/framework/blocEvent.dart';
import 'package:conta_da_epata_online/framework/pipe.dart';

abstract class ViewActions<BE extends BlocEvent> {
  final Pipe<BE> blocPipeIn;

  ViewActions(this.blocPipeIn);
}
