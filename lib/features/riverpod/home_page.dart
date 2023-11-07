import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_page.g.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}

class Item {
  const Item(
    this.id,
    this.title,
    this.price,
  );

  final String id;
  final String title;
  final int price;
}

class CartListPage extends ConsumerWidget {
  const CartListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [],
    );
  }
}

@Riverpod(dependencies: [])
Item currentItem(CurrentItemRef ref) => throw UnimplementedError();

@riverpod
Item bargenItem(BargenItemRef ref) {
  return ref.watch(currentItemProvider);
}

class CartItem extends ConsumerWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentItemProvider);
    return ListTile(
      title: Text(item.title),
    );
  }
}

// A non-scoped provider
@riverpod
int root(RootRef ref) => 0;

// A possibly scoped provider
@Riverpod(dependencies: [])
int scoped(ScopedRef ref) => 0;

// -----------

// No dependencies used, no need to specify "dependencies"
@riverpod
int example1(Example1Ref ref) => 0;

// We can specify an empty "dependencies" list if we wish to.
// This marks the provider as "scoped".
@Riverpod(dependencies: [])
int example2(Example2Ref ref) => 0;

@riverpod
int example3(Example3Ref ref) {
  // rootProvider is not scoped, no need to specify it as "dependencies"
  return ref.watch(rootProvider);
}

@Riverpod(dependencies: [scoped])
int example4(Example4Ref ref) {
  // scopedProvider is scoped and as such specifying "dependencies" is required.
  return ref.watch(scopedProvider);
}

// -----------

// scopedProvider isn't used and should therefore not be listed
@Riverpod(dependencies: [scoped])
int example5(Example5Ref ref) => 0;

@Riverpod(dependencies: [])
int example6(Example6Ref ref) {
  // scopedProvider is used but not present in the list of dependencies
  return ref.watch(scopedProvider);
}

@Riverpod(dependencies: [root])
int example7(Example7Ref ref) {
  // rootProvider is not a scoped provider. As such it shouldn't be listed in "dependencies"
  return ref.watch(rootProvider);
}
