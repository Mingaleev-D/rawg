import 'dart:convert';

class GamesResponseModel {
  final int count;
  final String next;
  // final String previous;
  final List<GamesResult> results;
  // final String seoTitle;
  // final String seoDescription;
  // final String seoKeywords;
  // final String seoH1;
  // final bool noindex;
  // final bool nofollow;
  // final String description;
  // final Filters filters;
  // final List<String> nofollowCollections;

  GamesResponseModel({
    required this.count,
    required this.next,
    //required this.previous,
    required this.results,
    // required this.seoTitle,
    // required this.seoDescription,
    // required this.seoKeywords,
    // required this.seoH1,
    // required this.noindex,
    // required this.nofollow,
    // required this.description,
    // required this.filters,
    // required this.nofollowCollections,
  });

  factory GamesResponseModel.fromJson(Map<String, dynamic> json) =>
      GamesResponseModel(
        count: json["count"],
        next: json["next"],
        //  previous: json["previous"],
        results: List<GamesResult>.from(
            json["results"].map((x) => GamesResult.fromJson(x))),
        // seoTitle: json["seo_title"],
        // seoDescription: json["seo_description"],
        // seoKeywords: json["seo_keywords"],
        // seoH1: json["seo_h1"],
        // noindex: json["noindex"],
        // nofollow: json["nofollow"],
        // description: json["description"],
        // filters: Filters.fromJson(json["filters"]),
        // nofollowCollections:
        //     List<String>.from(json["nofollow_collections"].map((x) => x)),
      );

  // Map<String, dynamic> toJson() => {
  //       "count": count,
  //       "next": next,
  //       "previous": previous,
  //       "results": List<dynamic>.from(results.map((x) => x.toJson())),
  //       "seo_title": seoTitle,
  //       "seo_description": seoDescription,
  //       "seo_keywords": seoKeywords,
  //       "seo_h1": seoH1,
  //       "noindex": noindex,
  //       "nofollow": nofollow,
  //       "description": description,
  //       "filters": filters.toJson(),
  //       "nofollow_collections":
  //           List<dynamic>.from(nofollowCollections.map((x) => x)),
  //     };
}

// class Filters {
//   final List<FiltersYear> years;
//
//   Filters({
//     required this.years,
//   });
//
//   factory Filters.fromJson(Map<String, dynamic> json) => Filters(
//         years: List<FiltersYear>.from(
//             json["years"].map((x) => FiltersYear.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "years": List<dynamic>.from(years.map((x) => x.toJson())),
//       };
// }
//
// class FiltersYear {
//   final int from;
//   final int to;
//   final String filter;
//   final int decade;
//   final List<YearYear> years;
//   final bool nofollow;
//   final int count;
//
//   FiltersYear({
//     required this.from,
//     required this.to,
//     required this.filter,
//     required this.decade,
//     required this.years,
//     required this.nofollow,
//     required this.count,
//   });
//
//   factory FiltersYear.fromJson(Map<String, dynamic> json) => FiltersYear(
//         from: json["from"],
//         to: json["to"],
//         filter: json["filter"],
//         decade: json["decade"],
//         years:
//             List<YearYear>.from(json["years"].map((x) => YearYear.fromJson(x))),
//         nofollow: json["nofollow"],
//         count: json["count"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "from": from,
//         "to": to,
//         "filter": filter,
//         "decade": decade,
//         "years": List<dynamic>.from(years.map((x) => x.toJson())),
//         "nofollow": nofollow,
//         "count": count,
//       };
// }
//
// class YearYear {
//   final int year;
//   final int count;
//   final bool nofollow;
//
//   YearYear({
//     required this.year,
//     required this.count,
//     required this.nofollow,
//   });
//
//   factory YearYear.fromJson(Map<String, dynamic> json) => YearYear(
//         year: json["year"],
//         count: json["count"],
//         nofollow: json["nofollow"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "year": year,
//         "count": count,
//         "nofollow": nofollow,
//       };
// }

class GamesResult {
  final int id;
  final String slug;
  final String name;
  final DateTime released;
  final bool tba;
  final String backgroundImage;
  final double rating;
  final int ratingTop;
  final List<Rating> ratings;
  // final int ratingsCount;
  // final int reviewsTextCount;
  // final int added;
  // final AddedByStatus addedByStatus;
  // final int metacritic;
  // final int playtime;
  // final int suggestionsCount;
  // final DateTime updated;
  // final dynamic userGame;
  // final int reviewsCount;
  // final String saturatedColor;
  // final String dominantColor;
  // final List<PlatformElement> platforms;
  // final List<ParentPlatform> parentPlatforms;
  // final List<Genre> genres;
  // final List<Store> stores;
  // final dynamic clip;
  // final List<Genre> tags;
  // final EsrbRating esrbRating;
  // final List<ShortScreenshot> shortScreenshots;

  GamesResult({
    required this.id,
    required this.slug,
    required this.name,
    required this.released,
    required this.tba,
    required this.backgroundImage,
    required this.rating,
    required this.ratingTop,
    required this.ratings,
    // required this.ratingsCount,
    // required this.reviewsTextCount,
    // required this.added,
    // required this.addedByStatus,
    // required this.metacritic,
    // required this.playtime,
    // required this.suggestionsCount,
    // required this.updated,
    // required this.userGame,
    // required this.reviewsCount,
    // required this.saturatedColor,
    // required this.dominantColor,
    // required this.platforms,
    // required this.parentPlatforms,
    // required this.genres,
    // required this.stores,
    // required this.clip,
    // required this.tags,
    // required this.esrbRating,
    // required this.shortScreenshots,
  });

  factory GamesResult.fromJson(Map<String, dynamic> json) => GamesResult(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        released: DateTime.parse(json["released"]),
        tba: json["tba"],
        backgroundImage: json["background_image"],
        rating: json["rating"]?.toDouble(),
        ratingTop: json["rating_top"],
        ratings:
            List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x))),
        // ratingsCount: json["ratings_count"],
        // reviewsTextCount: json["reviews_text_count"],
        // added: json["added"],
        // addedByStatus: AddedByStatus.fromJson(json["added_by_status"]),
        // metacritic: json["metacritic"],
        // playtime: json["playtime"],
        // suggestionsCount: json["suggestions_count"],
        // updated: DateTime.parse(json["updated"]),
        // userGame: json["user_game"],
        // reviewsCount: json["reviews_count"],
        // saturatedColor: json["saturated_color"],
        // dominantColor: json["dominant_color"],
        // platforms: List<PlatformElement>.from(
        //     json["platforms"].map((x) => PlatformElement.fromJson(x))),
        // parentPlatforms: List<ParentPlatform>.from(
        //     json["parent_platforms"].map((x) => ParentPlatform.fromJson(x))),
        // genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        // stores: List<Store>.from(json["stores"].map((x) => Store.fromJson(x))),
        // clip: json["clip"],
        // tags: List<Genre>.from(json["tags"].map((x) => Genre.fromJson(x))),
        // esrbRating: EsrbRating.fromJson(json["esrb_rating"]),
        // shortScreenshots: List<ShortScreenshot>.from(
        //     json["short_screenshots"].map((x) => ShortScreenshot.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "slug": slug,
  //       "name": name,
  //       "released":
  //           "${released.year.toString().padLeft(4, '0')}-${released.month.toString().padLeft(2, '0')}-${released.day.toString().padLeft(2, '0')}",
  //       "tba": tba,
  //       "background_image": backgroundImage,
  //       "rating": rating,
  //       "rating_top": ratingTop,
  //       "ratings": List<dynamic>.from(ratings.map((x) => x.toJson())),
  //       "ratings_count": ratingsCount,
  //       "reviews_text_count": reviewsTextCount,
  //       "added": added,
  //       "added_by_status": addedByStatus.toJson(),
  //       "metacritic": metacritic,
  //       "playtime": playtime,
  //       "suggestions_count": suggestionsCount,
  //       "updated": updated.toIso8601String(),
  //       "user_game": userGame,
  //       "reviews_count": reviewsCount,
  //       "saturated_color": saturatedColor,
  //       "dominant_color": dominantColor,
  //       "platforms": List<dynamic>.from(platforms.map((x) => x.toJson())),
  //       "parent_platforms":
  //           List<dynamic>.from(parentPlatforms.map((x) => x.toJson())),
  //       "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
  //       "stores": List<dynamic>.from(stores.map((x) => x.toJson())),
  //       "clip": clip,
  //       "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
  //       "esrb_rating": esrbRating.toJson(),
  //       "short_screenshots":
  //           List<dynamic>.from(shortScreenshots.map((x) => x.toJson())),
  //     };
}

class AddedByStatus {
  final int yet;
  final int owned;
  final int beaten;
  final int toplay;
  final int dropped;
  final int playing;

  AddedByStatus({
    required this.yet,
    required this.owned,
    required this.beaten,
    required this.toplay,
    required this.dropped,
    required this.playing,
  });

  factory AddedByStatus.fromJson(Map<String, dynamic> json) => AddedByStatus(
        yet: json["yet"],
        owned: json["owned"],
        beaten: json["beaten"],
        toplay: json["toplay"],
        dropped: json["dropped"],
        playing: json["playing"],
      );

  Map<String, dynamic> toJson() => {
        "yet": yet,
        "owned": owned,
        "beaten": beaten,
        "toplay": toplay,
        "dropped": dropped,
        "playing": playing,
      };
}

class EsrbRating {
  final int id;
  final String name;
  final String slug;

  EsrbRating({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory EsrbRating.fromJson(Map<String, dynamic> json) => EsrbRating(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}

class Genre {
  final int id;
  final String name;
  final String slug;
  final int gamesCount;
  final String imageBackground;
  final String domain;
  final String language;

  Genre({
    required this.id,
    required this.name,
    required this.slug,
    required this.gamesCount,
    required this.imageBackground,
    required this.domain,
    required this.language,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
        domain: json["domain"],
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "games_count": gamesCount,
        "image_background": imageBackground,
        "domain": domain,
        "language": language,
      };
}

class ParentPlatform {
  final EsrbRating platform;

  ParentPlatform({
    required this.platform,
  });

  factory ParentPlatform.fromJson(Map<String, dynamic> json) => ParentPlatform(
        platform: EsrbRating.fromJson(json["platform"]),
      );

  Map<String, dynamic> toJson() => {
        "platform": platform.toJson(),
      };
}

class PlatformElement {
  final PlatformPlatform platform;
  final DateTime releasedAt;
  final Requirements requirementsEn;
  final Requirements requirementsRu;

  PlatformElement({
    required this.platform,
    required this.releasedAt,
    required this.requirementsEn,
    required this.requirementsRu,
  });

  factory PlatformElement.fromJson(Map<String, dynamic> json) =>
      PlatformElement(
        platform: PlatformPlatform.fromJson(json["platform"]),
        releasedAt: DateTime.parse(json["released_at"]),
        requirementsEn: Requirements.fromJson(json["requirements_en"]),
        requirementsRu: Requirements.fromJson(json["requirements_ru"]),
      );

  Map<String, dynamic> toJson() => {
        "platform": platform.toJson(),
        "released_at":
            "${releasedAt.year.toString().padLeft(4, '0')}-${releasedAt.month.toString().padLeft(2, '0')}-${releasedAt.day.toString().padLeft(2, '0')}",
        "requirements_en": requirementsEn.toJson(),
        "requirements_ru": requirementsRu.toJson(),
      };
}

class PlatformPlatform {
  final int id;
  final String name;
  final String slug;
  final dynamic image;
  final dynamic yearEnd;
  final int yearStart;
  final int gamesCount;
  final String imageBackground;

  PlatformPlatform({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.yearEnd,
    required this.yearStart,
    required this.gamesCount,
    required this.imageBackground,
  });

  factory PlatformPlatform.fromJson(Map<String, dynamic> json) =>
      PlatformPlatform(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        yearEnd: json["year_end"],
        yearStart: json["year_start"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "year_end": yearEnd,
        "year_start": yearStart,
        "games_count": gamesCount,
        "image_background": imageBackground,
      };
}

class Requirements {
  final String minimum;
  final String recommended;

  Requirements({
    required this.minimum,
    required this.recommended,
  });

  factory Requirements.fromJson(Map<String, dynamic> json) => Requirements(
        minimum: json["minimum"],
        recommended: json["recommended"],
      );

  Map<String, dynamic> toJson() => {
        "minimum": minimum,
        "recommended": recommended,
      };
}

class Rating {
  final int id;
  final String title;
  final int count;
  final double percent;

  Rating({
    required this.id,
    required this.title,
    required this.count,
    required this.percent,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json["id"],
        title: json["title"],
        count: json["count"],
        percent: json["percent"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "count": count,
        "percent": percent,
      };
}

class ShortScreenshot {
  final int id;
  final String image;

  ShortScreenshot({
    required this.id,
    required this.image,
  });

  factory ShortScreenshot.fromJson(Map<String, dynamic> json) =>
      ShortScreenshot(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}

class Store {
  final int id;
  final Genre store;

  Store({
    required this.id,
    required this.store,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        store: Genre.fromJson(json["store"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "store": store.toJson(),
      };
}
