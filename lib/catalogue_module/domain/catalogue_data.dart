class CatalogueData {
  static Map<String, Map<String, Map<String, dynamic>>> map = {};
}
/*
                                   * for each item in cartList whether item has a non null choice is checked.
                                   * if yes,checks whether the CatalogueData.map contains a key with the product id.
                                   *   if yes,a new map key with choice is created with a value of map,which has two key:value pair(cartId and quantity).
                                   *   if no,a new map is created with productId as key and a map with choice as key and another map as value which contains two key:value pair(cartId and quantity).
                                   * ================structure======================================
                                   * CatalogueData.map={
                                   * productId1:{
                                   *            choiceId1:{
                                   *                       cartId:"cartIdValue"
                                   *                       quantity:2
                                   *                       },
                                   *            choiceId2:{
                                   *                       cartId:"cartIdValue"
                                   *                       quantity:42
                                   *                       },
                                   * },
                                   * productId2:{
                                   *            choiceId1:{
                                   *                       cartId:"cartIdValue"
                                   *                       quantity:2
                                   *                       },
                                   *            choiceId2:{
                                   *                       cartId:"cartIdValue"
                                   *                       quantity:42
                                   *                       },
                                   * },
                                   * }
                                   * */
