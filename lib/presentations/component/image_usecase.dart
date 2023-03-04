class ImageUsecase {

  static String imageProduct(String? name) {
    switch (name) {
      case "mobile-legends":
        return "assets/images/ml.png";
      case "call-of-duty-mobile":
        return "assets/images/cod.png";
      case "free-fire2":
        return "assets/images/ff.png";
      case "pubg-mobile":
        return "assets/images/pubg.png";
      case "dragon-raja":
        return "assets/images/dragon_raja.jpg";
      case "genshin-impact2":
        return "assets/images/genshin_impact.jpg";
      case "free-fire-max":
        return "assets/images/ff_max.png";
      case "tower-of-fantasy":
        return "assets/images/tower_of_fantasy.png";
      case "honkai-impact3":
        return "assets/images/hokai_impact_3.png";
      case "goddes-of-victory-nikke":
        return "assets/images/goddes_of_victory.png";
      case "life-after":
        return "assets/images/lifeafter.png";
      case "never-after":
        return "assets/images/never_after.png";
      case "marvel-super-war":
        return "assets/images/marvel_super_war.jpg";
      case "one-punch-man":
        return "assets/images/one_punch_man.jfif";
      case "the-legend-of-neverland":
        return "assets/images/the_legend_of_neverland.png";
      case "tom-and-jerry-chase":
        return "assets/images/tom_and_jerry_chase.png";
      case "super-sus":
        return "assets/images/super_sus.png";
      case "echocalypse":
        return "assets/images/echocalypse.png";
      case "sausage-man2":
        return "assets/images/susage_man.png";
      case "laplace-m2":
        return "assets/images/laplace_m.png";
      case "valorant2":
        return "assets/images/valorant.png";
      case "league-of-legends-wr":
        return "assets/images/wild_rift.jpg";
      case "arena-of-valor2":
        return "assets/images/aov.png";
      case "ragnarok-m-eternal-love":
        return "assets/images/ragnarok.png";
      case "ragnarok-x":
        return "assets/images/ragnarok_x.jpg";
      default:
        return "";
    }
  }

  static String product(String? category, double price) {
    switch (category) {
      case "mobile-legends":
        return diamondMobileLegend(price);
      case "call-of-duty-mobile":
        return cp();
      case "dragon-raja":
        return coupon();  
      case "pubg-mobile":
        return uc(price);
      case "genshin-impact2":
        return crystal(price);
      case "valorant2":
        return valorant();  
      default:
        return "";
    }
  }

  static String diamondMobileLegend(double price) {
    if (price < 100000) {
      return "assets/images/product/dm_small.png";
    } else if (price < 300000) {
      return "assets/images/product/dm_medium.png";
    } else if (price <= 1000000) {
      return "assets/images/product/dm_large.png";
    } else {
      return "assets/images/product/dm_extra_large.png";
    }
  }
  
  static String cp() {
    return "assets/images/product/cp_small.jfif";
  }
  
  static String coupon() {
    return "assets/images/product/coupon.png";
  }
  
  static String uc(double price) {
    if (price < 100000) {
      return "assets/images/product/uc_small.png";
    } else if (price < 500000) {
      return "assets/images/product/uc_medium.png";
    } else {
      return "assets/images/product/uc_large.jfif";
    }
  }
  
  static String crystal(double price) {
    if (price < 100000) {
      return "assets/images/product/genshin_crystal.png";
    } else {
      return "assets/images/product/genshin_crystal.png";
    }
  }
  
  static String valorant() {
    return "assets/images/product/valorant_point.png";
  }

}