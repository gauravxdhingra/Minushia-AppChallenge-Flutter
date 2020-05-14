// library menu_button;

// import 'package:flutter/material.dart';

// class MenuButton<T> extends StatefulWidget {
//   final Widget child;
//   final Widget toggledChild;
//   final MenuItemBuilder<T> itemBuilder;
//   final Widget divider;
//   final bool topDivider;
//   final List<T> items;
//   final MenuItemSelected<T> onItemSelected;
//   final BoxDecoration decoration;
//   final MenuButtonToggleCallback onMenuButtonToggle;
//   final ScrollPhysics scrollPhysics;
//   final double popupHeight;
//   final bool crossTheEdge;
//   final double edgeMargin;

//   const MenuButton({
//     @required final this.child,
//     @required final this.items,
//     @required final this.itemBuilder,
//     final this.toggledChild,
//     final this.divider,
//     final this.topDivider = true,
//     final this.onItemSelected,
//     final this.decoration,
//     final this.onMenuButtonToggle,
//     final this.scrollPhysics,
//     final this.popupHeight,
//     final this.crossTheEdge = false,
//     final this.edgeMargin = 0.0,
//   })  : assert(child != null),
//         assert(items != null),
//         assert(itemBuilder != null);

//   @override
//   State<StatefulWidget> createState() => _MenuButtonState<T>();
// }

// class _MenuButtonState<T> extends State<MenuButton<T>> {
//   @override
//   Widget build(BuildContext context) => InkWell(
//         child: Container(decoration: widget.decoration, child: widget.child),
//         onTap: togglePopup,
//       );

//   void togglePopup() {
//     widget.onMenuButtonToggle(true);

//     final List<Widget> items = widget.items
//         .map((value) => _MenuItem(
//               value: value,
//               child: widget.itemBuilder(value),
//             ))
//         .toList();
//     final RenderBox button = context.findRenderObject();
//     final RenderBox overlay = Overlay.of(context).context.findRenderObject();
//     final RelativeRect position = RelativeRect.fromRect(
//       Rect.fromPoints(
//         button.localToGlobal(const Offset(0, 0), ancestor: overlay),
//         button.localToGlobal(button.size.bottomRight(Offset.zero),
//             ancestor: overlay),
//       ),
//       Offset.zero & overlay.size,
//     );

//     if (items.isNotEmpty) {
//       _togglePopup(
//         context: context,
//         position: position,
//         items: items,
//         toggledChild: widget.toggledChild,
//         divider: widget.divider,
//         topDivider: widget.topDivider,
//         decoration: widget.decoration,
//         scrollPhysics: widget.scrollPhysics,
//         popupHeight: widget.popupHeight,
//         edgeMargin: widget.edgeMargin,
//         crossTheEdge: widget.crossTheEdge,
//       ).then<void>((T newValue) {
//         widget.onMenuButtonToggle(false);
//         if (mounted && newValue != null && widget.onItemSelected != null) {
//           widget.onItemSelected(newValue);
//         }
//       });
//     }
//   }

//   Future<T> _togglePopup({
//     @required BuildContext context,
//     @required RelativeRect position,
//     @required List<Widget> items,
//     Widget toggledChild,
//     Widget divider,
//     bool topDivider,
//     BoxDecoration decoration,
//     ScrollPhysics scrollPhysics,
//     double popupHeight,
//     bool crossTheEdge,
//     double edgeMargin,
//   }) =>
//       Navigator.push(
//         context,
//         _MenuRoute<T>(
//           position: position,
//           items: items,
//           toggledChild: toggledChild,
//           divider: divider,
//           topDivider: topDivider,
//           decoration: decoration,
//           scrollPhysics: scrollPhysics,
//           popupHeight: popupHeight,
//           crossTheEdge: crossTheEdge,
//           edgeMargin: edgeMargin,
//         ),
//       );
// }

// class _MenuRoute<T> extends PopupRoute<T> {
//   final RelativeRect position;
//   final List<Widget> items;
//   final Widget toggledChild;
//   final Widget divider;
//   final bool topDivider;
//   final BoxDecoration decoration;
//   final ScrollPhysics scrollPhysics;
//   final double popupHeight;
//   final bool crossTheEdge;
//   final double edgeMargin;

//   _MenuRoute({
//     final this.position,
//     final this.items,
//     final this.toggledChild,
//     final this.divider,
//     final this.topDivider,
//     final this.decoration,
//     final this.scrollPhysics,
//     final this.popupHeight,
//     final this.crossTheEdge,
//     final this.edgeMargin,
//   });

//   @override
//   Color get barrierColor => null;

//   @override
//   bool get barrierDismissible => true;

//   @override
//   String get barrierLabel => null;

//   @override
//   Duration get transitionDuration => const Duration(milliseconds: 300);

//   @override
//   Animation<double> createAnimation() => CurvedAnimation(
//         parent: super.createAnimation(),
//         curve: Curves.easeOutCubic,
//         reverseCurve: Curves.easeInCubic,
//       );

//   @override
//   Widget buildPage(
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//   ) =>
//       MediaQuery.removePadding(
//         context: context,
//         removeTop: true,
//         removeBottom: true,
//         removeLeft: true,
//         removeRight: true,
//         child: Builder(
//           builder: (BuildContext context) {
//             return CustomSingleChildLayout(
//               delegate: _MenuRouteLayout(
//                 position,
//               ),
//               child: _Menu<T>(
//                 route: this,
//                 scrollPhysics: scrollPhysics,
//                 popupHeight: popupHeight,
//                 crossTheEdge: crossTheEdge,
//                 edgeMargin: edgeMargin,
//               ),
//             );
//           },
//         ),
//       );
// }

// // Positioning of the menu on the screen.
// class _MenuRouteLayout extends SingleChildLayoutDelegate {
//   _MenuRouteLayout(this.position);

//   // Rectangle of underlying button, relative to the overlay's dimensions.
//   final RelativeRect position;

//   @override
//   BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
//     // The menu can be at most the size of the overlay minus 8.0 pixels in each
//     // direction.
//     return BoxConstraints.loose(constraints.biggest);
//   }

//   @override
//   Offset getPositionForChild(Size size, Size childSize) =>
//       Offset(position.left, position.top);

//   @override
//   bool shouldRelayout(_MenuRouteLayout oldDelegate) =>
//       position != oldDelegate.position;
// }

// class _Menu<T> extends StatefulWidget {
//   const _Menu({
//     Key key,
//     this.route,
//     this.scrollPhysics,
//     this.popupHeight,
//     this.edgeMargin,
//     this.crossTheEdge,
//   }) : super(key: key);

//   final _MenuRoute<T> route;
//   final ScrollPhysics scrollPhysics;
//   final double popupHeight;
//   final bool crossTheEdge;
//   final double edgeMargin;

//   @override
//   __MenuState<T> createState() => __MenuState<T>();
// }

// class __MenuState<T> extends State<_Menu<T>> {
//   final GlobalKey key = GlobalKey();
//   double width;

//   @override
//   void initState() {
//     super.initState();
//     if (widget.crossTheEdge == true) {
//       WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//         final RenderBox renderBox = key.currentContext.findRenderObject();
//         final Offset offset = renderBox.globalToLocal(Offset.zero);
//         final double x = offset.dx.abs();
//         final double screenWidth = MediaQuery.of(context).size.width;

//         setState(() => width = screenWidth - x - widget.edgeMargin);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> children = <Widget>[];

//     if (widget.route.topDivider) {
//       children.add(widget.route.divider);
//     }

//     for (int i = 0; i < widget.route.items.length; i += 1) {
//       children.add(widget.route.items[i]);

//       if (i < widget.route.items.length - 1) {
//         children.add(widget.route.divider);
//       }
//     }

//     final CurveTween opacity =
//         CurveTween(curve: const Interval(0.0, 1.0 / 8.0));
//     final CurveTween height = CurveTween(curve: const Interval(0.0, .9));
//     final CurveTween shadow = CurveTween(curve: const Interval(0.0, 1.0 / 4.0));

//     return Material(
//       color: Colors.transparent,
//       child: AnimatedBuilder(
//         animation: widget.route.animation,
//         builder: (BuildContext context, Widget child) => Opacity(
//           opacity: opacity.evaluate(widget.route.animation),
//           child: Container(
//             key: key,
//             width: width,
//             height: widget.popupHeight,
//             decoration: BoxDecoration(
//               border: widget.route.decoration.border,
//               borderRadius: widget.route.decoration.borderRadius,
//               // boxShadow: [
//               //   BoxShadow(
//               //       color: Color.fromARGB(
//               //           (20 * shadow.evaluate(widget.route.animation)).toInt(),
//               //           0,
//               //           0,
//               //           0),
//               //       offset: Offset(
//               //           0.0, 3.0 * shadow.evaluate(widget.route.animation)),
//               //       blurRadius: 5.0 * shadow.evaluate(widget.route.animation))
//               // ],
//             ),
//             child: ClipRRect(
//               borderRadius: widget.route.decoration.borderRadius,
//               child: IntrinsicWidth(
//                 child: SingleChildScrollView(
//                   physics:
//                       widget.scrollPhysics ?? NeverScrollableScrollPhysics(),
//                   child: ListBody(children: [
//                     _MenuButtonToggledChild(child: widget.route.toggledChild),
//                     Container(
//                       color: widget.route.decoration.color,
//                       child: Align(
//                         alignment: AlignmentDirectional.topStart,
//                         widthFactor: 1.0,
//                         heightFactor: height.evaluate(widget.route.animation),
//                         child: SingleChildScrollView(
//                           child: ListBody(
//                             children: children,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ]),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _MenuButtonToggledChild extends StatelessWidget {
//   final Widget child;

//   const _MenuButtonToggledChild({@required final this.child});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => Navigator.of(context).pop(),
//       child: child,
//     );
//   }
// }

// class _MenuItem<T> extends StatelessWidget {
//   final T value;
//   final Widget child;

//   const _MenuItem({this.value, @required final this.child});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//         onTap: () => Navigator.of(context).pop<T>(value), child: child);
//   }
// }

// typedef MenuButtonToggleCallback = void Function(bool isToggle);

// typedef MenuItemBuilder<T> = Widget Function(T value);

// typedef MenuItemSelected<T> = void Function(T value);
