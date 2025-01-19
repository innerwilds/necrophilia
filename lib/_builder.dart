import 'dart:async';

import 'package:macros/macros.dart';

final _basic = Uri.parse('package:flutter/src/widgets/basic.dart');
final _paintingAlignment = Uri.parse('package:flutter/src/painting/alignment.dart');

const Set<String> _aligns = {
  'topCenter',
  'topRight',
  'topLeft',

  'centerRight',
  'centerLeft',

  'bottomCenter',
  'bottomRight',
  'bottomLeft',
};

macro class AllAligns implements ClassTypesMacro {
  const AllAligns();

  @override
  FutureOr<void> buildTypesForClass(ClassDeclaration clazz, ClassTypeBuilder builder) async {
    final alignWidget = await builder.resolveIdentifier(_basic, 'Align');
    final alignmentClass = await builder.resolveIdentifier(_paintingAlignment, 'Alignment');

    for (final align in _aligns) {
      final className = align[0].toUpperCase() + align.substring(1);

      builder.declareType(className, DeclarationCode.fromParts([
        'final class $className extends ', alignWidget ,' {\n',
        '  const $className({\n',
        '    super.key,\n',
        '    super.widthFactor,\n',
        '    super.heightFactor,\n',
        '    super.child,\n',
        '  }) : super(alignment: ', alignmentClass ,'.$align);\n',
        '}',
      ]));
    }
  }
}