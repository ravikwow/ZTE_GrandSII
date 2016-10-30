.class Lcom/android/server/pm/MiuiPackageManagerService;
.super Ljava/lang/Object;
.source "MiuiPackageManagerService.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static addIgnoreApk(Ljava/lang/String;)V
    .locals 0
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 21
    invoke-static {p0}, Lcom/android/server/pm/PackageManagerServiceInjector;->addIgnoreApk(Ljava/lang/String;)V

    .line 22
    return-void
.end method

.method static addLostPackagePropertyForOta(Landroid/content/Context;)V
    .locals 0
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 58
    invoke-static {p0}, Lcom/android/server/pm/PackageManagerServiceInjector;->addLostPackagePropertyForOta(Landroid/content/Context;)V

    .line 59
    return-void
.end method

.method static addMiuiSharedUids(Lcom/android/server/pm/Settings;Z)V
    .locals 0
    .param p0, "settings"    # Lcom/android/server/pm/Settings;
    .param p1, "multipleUids"    # Z

    .prologue
    .line 17
    invoke-static {p0, p1}, Lcom/android/server/pm/PackageManagerServiceInjector;->addMiuiSharedUids(Lcom/android/server/pm/Settings;Z)V

    .line 18
    return-void
.end method

.method static checkApk(Landroid/content/Context;Landroid/os/Message;Z)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "msg"    # Landroid/os/Message;
    .param p2, "systemReady"    # Z

    .prologue
    .line 42
    invoke-static {p0, p1, p2}, Lcom/android/server/pm/PackageManagerServiceInjector;->checkApk(Landroid/content/Context;Landroid/os/Message;Z)Z

    move-result v0

    return v0
.end method

.method static checkMiuiIntent(Lcom/android/server/pm/PackageManagerService;Landroid/content/Intent;Ljava/lang/String;ILjava/util/List;I)Landroid/content/pm/ResolveInfo;
    .locals 1
    .param p0, "pms"    # Lcom/android/server/pm/PackageManagerService;
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "resolvedType"    # Ljava/lang/String;
    .param p3, "flags"    # I
    .param p5, "userId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/server/pm/PackageManagerService;",
            "Landroid/content/Intent;",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/List",
            "<",
            "Landroid/content/pm/ResolveInfo;",
            ">;I)",
            "Landroid/content/pm/ResolveInfo;"
        }
    .end annotation

    .prologue
    .line 30
    .local p4, "query":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-static/range {p0 .. p5}, Lcom/android/server/pm/PackageManagerServiceInjector;->checkMiuiIntent(Lcom/android/server/pm/PackageManagerService;Landroid/content/Intent;Ljava/lang/String;ILjava/util/List;I)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    return-object v0
.end method

.method static checkPackageForUserModeLPw(Lcom/android/server/pm/PackageSetting;)V
    .locals 0
    .param p0, "ps"    # Lcom/android/server/pm/PackageSetting;

    .prologue
    .line 38
    invoke-static {p0}, Lcom/android/server/pm/PackageManagerServiceInjector;->checkPackageForUserModeLPw(Lcom/android/server/pm/PackageSetting;)V

    .line 39
    return-void
.end method

.method static getInstallerPackageName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "packageName"    # Ljava/lang/String;
    .param p1, "installerPackageName"    # Ljava/lang/String;

    .prologue
    .line 34
    invoke-static {p0, p1}, Lcom/android/server/pm/PackageManagerServiceInjector;->getInstallerPackageName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static ignoreApk(Ljava/lang/String;)Z
    .locals 1
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 25
    invoke-static {p0}, Lcom/android/server/pm/PackageManagerServiceInjector;->ignoreApk(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static initExtraGuard(Landroid/content/Context;)V
    .locals 0
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 46
    invoke-static {p0}, Lcom/android/server/pm/PackageManagerServiceInjector;->initExtraGuard(Landroid/content/Context;)V

    .line 47
    return-void
.end method

.method static performPreinstallApp(Lcom/android/server/pm/PackageManagerService;Lcom/android/server/pm/Settings;)V
    .locals 0
    .param p0, "pms"    # Lcom/android/server/pm/PackageManagerService;
    .param p1, "curPkgSettings"    # Lcom/android/server/pm/Settings;

    .prologue
    .line 50
    invoke-static {p0, p1}, Lcom/android/server/pm/PackageManagerServiceInjector;->performPreinstallApp(Lcom/android/server/pm/PackageManagerService;Lcom/android/server/pm/Settings;)V

    .line 51
    return-void
.end method

.method static protectAppFromDeleting(Lcom/android/server/pm/PackageManagerService;Ljava/lang/String;Landroid/content/pm/IPackageDeleteObserver;)Z
    .locals 1
    .param p0, "pms"    # Lcom/android/server/pm/PackageManagerService;
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "observer"    # Landroid/content/pm/IPackageDeleteObserver;

    .prologue
    .line 54
    invoke-static {p0, p1, p2}, Lcom/android/server/pm/PackageManagerServiceInjector;->protectAppFromDeleting(Lcom/android/server/pm/PackageManagerService;Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
