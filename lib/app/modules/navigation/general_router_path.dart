class GeneralRouterPath {
  final String? pathName;
  final bool isUnkown;

  GeneralRouterPath.home(this.pathName) : isUnkown = false;

  GeneralRouterPath.otherPage(this.pathName) : isUnkown = false;

  GeneralRouterPath.unKown()
      : pathName = null,
        isUnkown = true;

  bool get isGeneralPage => pathName == null;
  bool get isOtherPage => pathName != null;
}
