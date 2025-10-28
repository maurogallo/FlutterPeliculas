import 'dart:convert';

class CreditsRepsonse {
    int id;
    List<Cast> cast;
    List<Cast> crew;

    CreditsRepsonse({
        required this.id,
        required this.cast,
        required this.crew,
    });

    factory CreditsRepsonse.fromJson(String str) => CreditsRepsonse.fromMap(json.decode(str));

    factory CreditsRepsonse.fromMap(Map<String, dynamic> json) => CreditsRepsonse(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
        crew: List<Cast>.from(json["crew"].map((x) => Cast.fromMap(x))),
    );

    
}

class Cast {
    bool adult;
    int gender;
    int id;
    String knownForDepartment;
    String name;
    String originalName;
    double popularity;
    String? profilePath;
    int? castId;
    String? character;
    String creditId;
    int? order;
    String? department;
    String? job;



    Cast({
        required this.adult,
        required this.gender,
        required this.id,
        required this.knownForDepartment,
        required this.name,
        required this.originalName,
        required this.popularity,
        this.profilePath,
        this.castId,
        this.character,
        required this.creditId,
        this.order,
        this.department,
        this.job,
    });

    get fullProfilePath {
      if ( this.profilePath != null ) {
        return 'https://image.tmdb.org/t/p/w500${ this.profilePath }';
      }
      
      return 'https://i.stack.imgur.com/GNhxO.png';
    }

    factory Cast.fromJson(String str) => Cast.fromMap(json.decode(str));


    factory Cast.fromMap(Map<String, dynamic> json) => Cast(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
        castId: json["cast_id"] == null ? 0 : json["cast_id"],
        character: json["character"] == null ? '' : json["character"],
        creditId: json["credit_id"],
        order: json["order"] == null ? 0 : json["order"],
        department: json["department"] == null ? null : json["department"],
        job: json["job"] == null ? null : json["job"],
    );
   
}