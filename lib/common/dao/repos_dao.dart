import 'package:blackflag_github_flutter/common/net/address.dart';
import 'package:blackflag_github_flutter/common/net/trending/github_trending.dart';

import 'dao_result.dart';

class ReposDao {
  static getTrendDao({since = 'daily', languageType, page = 0}) async {
    String localLanguage = (languageType != null) ? languageType : "*";
    String url = Address.trending(since, localLanguage);
    var res = await GitHubTrending().fetchTrending(url);
    if (res != null && res.success && res.data.length > 0) {
      return new DataResult(res.data, true);
    } else {
      return new DataResult(null, false);
    }
  }
}
