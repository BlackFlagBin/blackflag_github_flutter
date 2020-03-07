import 'package:blackflag_github_flutter/common/utils/common_utils.dart';
import 'package:blackflag_github_flutter/common/utils/event_utils.dart';

class Event {
  String type;
  bool public;
  Repo repo;
  Actor actor;
  Actor org;
  String createdAt;
  String id;

  String actionUser;
  String actionUserPic;
  String actionDes;
  String actionTime;
  String actionTarget;

  Event({this.type, this.public, this.repo, this.actor, this.org, this.createdAt, this.id});

  Event.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    public = json['public'];
    repo = json['repo'] != null ? new Repo.fromJson(json['repo']) : null;
    actor = json['actor'] != null ? new Actor.fromJson(json['actor']) : null;
    org = json['org'] != null ? new Actor.fromJson(json['org']) : null;
    createdAt = json['created_at'];
    id = json['id'];

    actionUser = json["actor"]["display_login"];
    actionUserPic = json["actor"]["avatar_url"];
    var other = EventUtils.getActionAndDes(json);
    actionDes = other["des"];
    actionTime = CommonUtils.getNewsTimeStr(DateTime.parse(json["created_at"]));
    actionTarget = other["actionStr"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['public'] = this.public;
    if (this.repo != null) {
      data['repo'] = this.repo.toJson();
    }
    if (this.actor != null) {
      data['actor'] = this.actor.toJson();
    }
    if (this.org != null) {
      data['org'] = this.org.toJson();
    }
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

class Repo {
  int id;
  String name;
  String url;

  Repo({this.id, this.name, this.url});

  Repo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Actor {
  int id;
  String login;
  String gravatarId;
  String avatarUrl;
  String url;

  Actor({this.id, this.login, this.gravatarId, this.avatarUrl, this.url});

  Actor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    gravatarId = json['gravatar_id'];
    avatarUrl = json['avatar_url'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['login'] = this.login;
    data['gravatar_id'] = this.gravatarId;
    data['avatar_url'] = this.avatarUrl;
    data['url'] = this.url;
    return data;
  }
}
