import 'package:blackflag_github_flutter/common/net/address.dart';
import 'package:blackflag_github_flutter/common/net/trending/github_trending.dart';
import 'package:blackflag_github_flutter/widget/repos_item.dart';

import 'dao_result.dart';

class ReposDao {
  static Future<DataResult> getTrendDao({since = 'daily', languageType, page = 0}) async {
    String localLanguage = (languageType != null) ? languageType : "*";
    String url = Address.trending(since, localLanguage);
    var res = await GitHubTrending().fetchTrending(url);
    if (res != null && res.success && res.data.length > 0) {
      List<ReposViewModel> list = [];
      if (res.data == null || res.data.length == 0) {
        return new DataResult(null, true);
      }
      for (var i = 0; i < res.data.length; ++i) {
        TrendingRepoModel model = res.data[i];
        ReposViewModel reposViewModel = ReposViewModel();
        reposViewModel.ownerName = model.name;
        reposViewModel.ownerPic = model.contributors[0];
        reposViewModel.repositoryName = model.reposName;
        reposViewModel.repositoryStar = model.starCount;
        reposViewModel.repositoryFork = model.forkCount;
        reposViewModel.repositoryWatch = model.meta;
        reposViewModel.repositoryType = model.language;
        reposViewModel.repositoryDes = model.description;
        list.add(reposViewModel);
      }
      return new DataResult(list, true);
    } else {
      return new DataResult(null, false);
    }
  }
}
