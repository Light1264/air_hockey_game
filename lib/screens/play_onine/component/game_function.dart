

  // gridSizingFunction({
  //   required double left,
  //   required double top,
  //   required double minY,
  //   required double maxY,
  // }) async {
  //   final gridX =
  //       ((MediaQuery.of(context).size.width - getProportionateScreenWidth(14)) /
  //               5)
  //           .ceilToDouble();
  //   final gridY = ((MediaQuery.of(context).size.height -
  //               getProportionateScreenWidth(14)) /
  //           11)
  //       .ceilToDouble();
  //   /**
  //    * Get grid to send to DB 
  //    */
  //   final verticalGrid = (top / gridY).ceilToDouble();
  //   final horizontalGrid = (left / gridX).ceilToDouble();

  //   if (!(lastKnownX == horizontalGrid.toDouble() &&
  //       lastKnownY == verticalGrid.toDouble())) {
  //     if (
  //         // widget.gameId != null &&
  //         widget.gameMode == GameMode.multiplayer) {
  //       // GameService.instance.updatePaddleMovement(
  //       // widget.gameId!,
  //       // widget.playerId!,
  //       // horizontalGrid,
  //       //   verticalGrid,
  //       // );
  //     }
  //   }
  //   lastKnownX = horizontalGrid.toDouble();
  //   lastKnownY = verticalGrid.toDouble();
  //   /**
  //    * On getting the grid, multiply the (phoneWidth -14.w / 5).toCeiling on X and (phoneHeight -14.w / 11).toCeiling on Y
  //    * On getting on other phone
  //    * 11 - verticalGrid
  //    * */
  // }