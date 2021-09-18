// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

List<Launches> welcomeFromJson(String str) =>
    List<Launches>.from(json.decode(str).map((x) => Launches.fromJson(x)));

class Launches {
  Launches(
      {this.fairings,
      this.links,
      this.staticFireDateUtc,
      this.staticFireDateUnix,
      this.net,
      this.window,
      this.rocket,
      this.success,
      this.failures,
      this.details,
      this.crew,
      this.ships,
      this.capsules,
      this.payloads,
      this.launchpad,
      this.flightNumber,
      this.name,
      this.dateUtc,
      this.dateUnix,
      this.dateLocal,
      this.datePrecision,
      this.upcoming,
      this.cores,
      this.autoUpdate,
      this.tbd,
      this.launchLibraryId,
      this.id});

  Fairings? fairings;
  Links? links;
  DateTime? staticFireDateUtc;
  int? staticFireDateUnix;
  bool? net;
  int? window;
  Rocket? rocket;
  bool? success;
  List<Failure>? failures;
  String? details;
  List<String>? crew;
  List<String>? ships;
  List<String>? capsules;
  List<String>? payloads;
  Launchpad? launchpad;
  int? flightNumber;
  String? name;
  DateTime? dateUtc;
  int? dateUnix;
  DateTime? dateLocal;
  DatePrecision? datePrecision;
  bool? upcoming;
  List<Core>? cores;
  bool? autoUpdate;
  bool? tbd;
  String? launchLibraryId;
  String? id;

  factory Launches.fromJson(Map<String, dynamic> json) => Launches(
        fairings: json["fairings"] == null
            ? null
            : Fairings.fromJson(json["fairings"]),
        links: Links.fromJson(json["links"]),
        staticFireDateUtc: json["static_fire_date_utc"] == null
            ? null
            : DateTime.parse(json["static_fire_date_utc"]),
        staticFireDateUnix: json["static_fire_date_unix"],
        net: json["net"],
        window: json["window"],
        rocket: rocketValues.map![json["rocket"]],
        success: json["success"],
        failures: List<Failure>.from(
            json["failures"].map((x) => Failure.fromJson(x))),
        details: json["details"],
        crew: List<String>.from(json["crew"].map((x) => x)),
        ships: List<String>.from(json["ships"].map((x) => x)),
        capsules: List<String>.from(json["capsules"].map((x) => x)),
        payloads: List<String>.from(json["payloads"].map((x) => x)),
        launchpad: launchpadValues.map![json["launchpad"]],
        flightNumber: json["flight_number"],
        name: json["name"],
        dateUtc: DateTime.parse(json["date_utc"]),
        dateUnix: json["date_unix"],
        dateLocal: DateTime.parse(json["date_local"]),
        datePrecision: datePrecisionValues.map![json["date_precision"]],
        upcoming: json["upcoming"],
        cores: List<Core>.from(json["cores"].map((x) => Core.fromJson(x))),
        autoUpdate: json["auto_update"],
        tbd: json["tbd"],
        launchLibraryId: json["launch_library_id"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "fairings": fairings == null ? null : fairings!.toJson(),
        "links": links!.toJson(),
        "static_fire_date_utc": staticFireDateUtc == null
            ? null
            : staticFireDateUtc!.toIso8601String(),
        "static_fire_date_unix": staticFireDateUnix,
        "net": net,
        "window": window,
        "rocket": rocketValues.reverse[rocket],
        "success": success,
        "failures": List<dynamic>.from(failures!.map((x) => x.toJson())),
        "details": details,
        "crew": List<dynamic>.from(crew!.map((x) => x)),
        "ships": List<dynamic>.from(ships!.map((x) => x)),
        "capsules": List<dynamic>.from(capsules!.map((x) => x)),
        "payloads": List<dynamic>.from(payloads!.map((x) => x)),
        "launchpad": launchpadValues.reverse[launchpad],
        "flight_number": flightNumber,
        "name": name,
        "date_utc": dateUtc!.toIso8601String(),
        "date_unix": dateUnix,
        "date_local": dateLocal!.toIso8601String(),
        "date_precision": datePrecisionValues.reverse[datePrecision],
        "upcoming": upcoming,
        "cores": List<dynamic>.from(cores!.map((x) => x.toJson())),
        "auto_update": autoUpdate,
        "tbd": tbd,
        "launch_library_id": launchLibraryId,
        "id": id,
      };
}

class Core {
  Core({
    this.core,
    this.flight,
    this.gridfins,
    this.legs,
    this.reused,
    this.landingAttempt,
    this.landingSuccess,
    this.landingType,
    this.landpad,
  });

  String? core;
  int? flight;
  bool? gridfins;
  bool? legs;
  bool? reused;
  bool? landingAttempt;
  bool? landingSuccess;
  LandingType? landingType;
  Landpad? landpad;

  factory Core.fromJson(Map<String, dynamic> json) => Core(
        core: json["core"],
        flight: json["flight"],
        gridfins: json["gridfins"],
        legs: json["legs"],
        reused: json["reused"],
        landingAttempt: json["landing_attempt"],
        landingSuccess: json["landing_success"],
        landingType: json["landing_type"] == null
            ? null
            : landingTypeValues.map![json["landing_type"]],
        landpad: json["landpad"] == null
            ? null
            : landpadValues.map![json["landpad"]],
      );

  Map<String, dynamic> toJson() => {
        "core": core,
        "flight": flight,
        "gridfins": gridfins,
        "legs": legs,
        "reused": reused,
        "landing_attempt": landingAttempt,
        "landing_success": landingSuccess,
        "landing_type":
            landingType == null ? null : landingTypeValues.reverse[landingType],
        "landpad": landpad == null ? null : landpadValues.reverse[landpad],
      };
}

enum LandingType { OCEAN, ASDS, RTLS }

final landingTypeValues = EnumValues({
  "ASDS": LandingType.ASDS,
  "Ocean": LandingType.OCEAN,
  "RTLS": LandingType.RTLS
});

enum Landpad {
  THE_5_E9_E3032383_ECB761634_E7_CB,
  THE_5_E9_E3032383_ECB6_BB234_E7_CA,
  THE_5_E9_E3032383_ECB267_A34_E7_C7,
  THE_5_E9_E3033383_ECBB9_E534_E7_CC,
  THE_5_E9_E3032383_ECB90_A834_E7_C8,
  THE_5_E9_E3032383_ECB554034_E7_C9,
  THE_5_E9_E3033383_ECB075134_E7_CD
}

final landpadValues = EnumValues({
  "5e9e3032383ecb267a34e7c7": Landpad.THE_5_E9_E3032383_ECB267_A34_E7_C7,
  "5e9e3032383ecb554034e7c9": Landpad.THE_5_E9_E3032383_ECB554034_E7_C9,
  "5e9e3032383ecb6bb234e7ca": Landpad.THE_5_E9_E3032383_ECB6_BB234_E7_CA,
  "5e9e3032383ecb761634e7cb": Landpad.THE_5_E9_E3032383_ECB761634_E7_CB,
  "5e9e3032383ecb90a834e7c8": Landpad.THE_5_E9_E3032383_ECB90_A834_E7_C8,
  "5e9e3033383ecb075134e7cd": Landpad.THE_5_E9_E3033383_ECB075134_E7_CD,
  "5e9e3033383ecbb9e534e7cc": Landpad.THE_5_E9_E3033383_ECBB9_E534_E7_CC
});

enum DatePrecision { HOUR, MONTH, DAY, QUARTER }

final datePrecisionValues = EnumValues({
  "day": DatePrecision.DAY,
  "hour": DatePrecision.HOUR,
  "month": DatePrecision.MONTH,
  "quarter": DatePrecision.QUARTER
});

class Failure {
  Failure({
    this.time,
    this.altitude,
    this.reason,
  });

  int? time;
  int? altitude;
  String? reason;

  factory Failure.fromJson(Map<String, dynamic> json) => Failure(
        time: json["time"],
        altitude: json["altitude"],
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "altitude": altitude,
        "reason": reason,
      };
}

class Fairings {
  Fairings({
    this.reused,
    this.recoveryAttempt,
    this.recovered,
    this.ships,
  });

  bool? reused;
  bool? recoveryAttempt;
  bool? recovered;
  List<Ship>? ships;

  factory Fairings.fromJson(Map<String, dynamic> json) => Fairings(
        reused: json["reused"],
        recoveryAttempt: json["recovery_attempt"],
        recovered: json["recovered"],
        ships: List<Ship>.from(json["ships"].map((x) => shipValues.map![x])),
      );

  Map<String, dynamic> toJson() => {
        "reused": reused,
        "recovery_attempt": recoveryAttempt,
        "recovered": recovered,
        "ships": List<dynamic>.from(ships!.map((x) => shipValues.reverse[x])),
      };
}

enum Ship {
  THE_5_EA6_ED2_E080_DF4000697_C908,
  THE_5_EA6_ED2_F080_DF4000697_C90_C,
  THE_5_EA6_ED2_F080_DF4000697_C90_D,
  THE_5_EA6_ED2_E080_DF4000697_C907,
  THE_5_EA6_ED2_E080_DF4000697_C909,
  THE_6059166413_F40_E27_E8_AF34_B6,
  THE_5_EA6_ED2_F080_DF4000697_C90_B,
  THE_60_C8_C7_A45_D4819007_EA69871
}

final shipValues = EnumValues({
  "5ea6ed2e080df4000697c907": Ship.THE_5_EA6_ED2_E080_DF4000697_C907,
  "5ea6ed2e080df4000697c908": Ship.THE_5_EA6_ED2_E080_DF4000697_C908,
  "5ea6ed2e080df4000697c909": Ship.THE_5_EA6_ED2_E080_DF4000697_C909,
  "5ea6ed2f080df4000697c90b": Ship.THE_5_EA6_ED2_F080_DF4000697_C90_B,
  "5ea6ed2f080df4000697c90c": Ship.THE_5_EA6_ED2_F080_DF4000697_C90_C,
  "5ea6ed2f080df4000697c90d": Ship.THE_5_EA6_ED2_F080_DF4000697_C90_D,
  "6059166413f40e27e8af34b6": Ship.THE_6059166413_F40_E27_E8_AF34_B6,
  "60c8c7a45d4819007ea69871": Ship.THE_60_C8_C7_A45_D4819007_EA69871
});

enum Launchpad {
  THE_5_E9_E4502_F5090995_DE566_F86,
  THE_5_E9_E4501_F509094_BA4566_F84,
  THE_5_E9_E4502_F509092_B78566_F87,
  THE_5_E9_E4502_F509094188566_F88
}

final launchpadValues = EnumValues({
  "5e9e4501f509094ba4566f84": Launchpad.THE_5_E9_E4501_F509094_BA4566_F84,
  "5e9e4502f509092b78566f87": Launchpad.THE_5_E9_E4502_F509092_B78566_F87,
  "5e9e4502f509094188566f88": Launchpad.THE_5_E9_E4502_F509094188566_F88,
  "5e9e4502f5090995de566f86": Launchpad.THE_5_E9_E4502_F5090995_DE566_F86
});

class Links {
  Links({
    this.patch,
    this.reddit,
    this.flickr,
    this.presskit,
    this.webcast,
    this.youtubeId,
    this.article,
    this.wikipedia,
  });

  Patch? patch;
  Reddit? reddit;
  Flickr? flickr;
  String? presskit;
  String? webcast;
  String? youtubeId;
  String? article;
  String? wikipedia;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        patch: Patch.fromJson(json["patch"]),
        reddit: Reddit.fromJson(json["reddit"]),
        flickr: Flickr.fromJson(json["flickr"]),
        presskit: json["presskit"],
        webcast: json["webcast"],
        youtubeId: json["youtube_id"],
        article: json["article"],
        wikipedia: json["wikipedia"],
      );

  Map<String, dynamic> toJson() => {
        "patch": patch!.toJson(),
        "reddit": reddit!.toJson(),
        "flickr": flickr!.toJson(),
        "presskit": presskit,
        "webcast": webcast,
        "youtube_id": youtubeId,
        "article": article,
        "wikipedia": wikipedia,
      };
}

class Flickr {
  Flickr({
    this.small,
    this.original,
  });

  List<dynamic>? small;
  List<String>? original;

  factory Flickr.fromJson(Map<String, dynamic> json) => Flickr(
        small: List<dynamic>.from(json["small"].map((x) => x)),
        original: List<String>.from(json["original"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "small": List<dynamic>.from(small!.map((x) => x)),
        "original": List<dynamic>.from(original!.map((x) => x)),
      };
}

class Patch {
  Patch({
    this.small,
    this.large,
  });

  String? small;
  String? large;

  factory Patch.fromJson(Map<String, dynamic> json) => Patch(
        small: json["small"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "large": large,
      };
}

class Reddit {
  Reddit({
    this.campaign,
    this.launch,
    this.media,
    this.recovery,
  });

  String? campaign;
  String? launch;
  String? media;
  String? recovery;

  factory Reddit.fromJson(Map<String, dynamic> json) => Reddit(
        campaign: json["campaign"],
        launch: json["launch"],
        media: json["media"],
        recovery: json["recovery"],
      );

  Map<String, dynamic> toJson() => {
        "campaign": campaign,
        "launch": launch,
        "media": media,
        "recovery": recovery,
      };
}

enum Rocket {
  THE_5_E9_D0_D95_EDA69955_F709_D1_EB,
  THE_5_E9_D0_D95_EDA69973_A809_D1_EC,
  THE_5_E9_D0_D95_EDA69974_DB09_D1_ED
}

final rocketValues = EnumValues({
  "5e9d0d95eda69955f709d1eb": Rocket.THE_5_E9_D0_D95_EDA69955_F709_D1_EB,
  "5e9d0d95eda69973a809d1ec": Rocket.THE_5_E9_D0_D95_EDA69973_A809_D1_EC,
  "5e9d0d95eda69974db09d1ed": Rocket.THE_5_E9_D0_D95_EDA69974_DB09_D1_ED
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
