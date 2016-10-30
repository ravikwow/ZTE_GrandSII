.class Lcom/android/server/pm/PackageManagerServiceInjectorProxy;
.super Ljava/lang/Object;
.source "PackageManagerServiceInjectorProxy.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static adjustCpuAbisForSharedUserLPw(Lcom/android/server/pm/PackageManagerService;Ljava/util/Set;Landroid/content/pm/PackageParser$Package;ZZ)V
    .locals 0
    .param p0, "pms"    # Lcom/android/server/pm/PackageManagerService;
    .param p2, "scannedPackage"    # Landroid/content/pm/PackageParser$Package;
    .param p3, "forceDexOpt"    # Z
    .param p4, "deferDexOpt"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/server/pm/PackageManagerService;",
            "Ljava/util/Set",
            "<",
            "Lcom/android/server/pm/PackageSetting;",
            ">;",
            "Landroid/content/pm/PackageParser$Package;",
            "ZZ)V"
        }
    .end annotation

    .prologue
    .line 46
    .local p1, "packagesForUser":Ljava/util/Set;, "Ljava/util/Set<Lcom/android/server/pm/PackageSetting;>;"
    return-void
.end method

.method static checkApk(Landroid/content/Context;Landroid/os/Message;Z)Z
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "msg"    # Landroid/os/Message;
    .param p2, "systemReady"    # Z

    .prologue
    const/4 v2, 0x1

    .line 27
    iget v3, p1, Landroid/os/Message;->what:I

    const/4 v4, 0x5

    if-ne v3, v4, :cond_0

    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v3, :cond_0

    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v3, v3, Lcom/android/server/pm/PackageManagerService$InstallParams;

    if-eqz v3, :cond_0

    if-nez p2, :cond_1

    .line 41
    :cond_0
    :goto_0
    return v2

    .line 30
    :cond_1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/android/server/pm/PackageManagerService$InstallParams;

    .line 31
    .local v0, "insallParams":Lcom/android/server/pm/PackageManagerService$InstallParams;
    invoke-virtual {v0}, Lcom/android/server/pm/PackageManagerService$InstallParams;->getPackageUri()Landroid/net/Uri;

    move-result-object v3

    iget v4, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->flags:I

    invoke-static {p0, v3, v4}, Lmiui/provider/ExtraGuard;->checkApk(Landroid/content/Context;Landroid/net/Uri;I)I

    move-result v1

    .line 32
    .local v1, "status":I
    if-eq v1, v2, :cond_0

    .line 33
    iget-object v2, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->observer:Landroid/content/pm/IPackageInstallObserver;

    if-eqz v2, :cond_2

    .line 35
    :try_start_0
    iget-object v2, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->observer:Landroid/content/pm/IPackageInstallObserver;

    const/4 v3, 0x0

    invoke-interface {v2, v3, v1}, Landroid/content/pm/IPackageInstallObserver;->packageInstalled(Ljava/lang/String;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    :cond_2
    :goto_1
    const/4 v2, 0x0

    goto :goto_0

    .line 36
    :catch_0
    move-exception v2

    goto :goto_1
.end method

.method static checkApkOnlySupport32BitForUserMode(Landroid/content/pm/PackageParser$Package;)V
    .locals 0
    .param p0, "pkg"    # Landroid/content/pm/PackageParser$Package;

    .prologue
    .line 56
    return-void
.end method

.method static checkMiuiSdk(Landroid/content/pm/PackageParser$Package;Lcom/android/server/pm/PackageManagerService;)Z
    .locals 14
    .param p0, "pkg"    # Landroid/content/pm/PackageParser$Package;
    .param p1, "pms"    # Lcom/android/server/pm/PackageManagerService;

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 66
    const/4 v5, -0x1

    .line 67
    .local v5, "miuiManifestResId":I
    iget-object v1, p0, Landroid/content/pm/PackageParser$Package;->mAppMetaData:Landroid/os/Bundle;

    .line 68
    .local v1, "bundle":Landroid/os/Bundle;
    if-eqz v1, :cond_0

    .line 69
    const-string v11, "com.miui.sdk.manifest"

    const/4 v12, -0x1

    invoke-virtual {v1, v11, v12}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v5

    .line 73
    :cond_0
    :try_start_0
    new-instance v0, Landroid/content/res/AssetManager;

    invoke-direct {v0}, Landroid/content/res/AssetManager;-><init>()V

    .line 74
    .local v0, "assmgr":Landroid/content/res/AssetManager;
    iget-object v11, p0, Landroid/content/pm/PackageParser$Package;->mScanPath:Ljava/lang/String;

    invoke-virtual {v0, v11}, Landroid/content/res/AssetManager;->addAssetPath(Ljava/lang/String;)I

    move-result v2

    .line 75
    .local v2, "cookie":I
    if-eqz v2, :cond_3

    .line 76
    new-instance v7, Landroid/content/res/MiuiResources;

    iget-object v11, p1, Lcom/android/server/pm/PackageManagerService;->mMetrics:Landroid/util/DisplayMetrics;

    const/4 v12, 0x0

    invoke-direct {v7, v0, v11, v12}, Landroid/content/res/MiuiResources;-><init>(Landroid/content/res/AssetManager;Landroid/util/DisplayMetrics;Landroid/content/res/Configuration;)V

    .line 77
    .local v7, "res":Landroid/content/res/MiuiResources;
    const/4 v6, 0x0

    .line 78
    .local v6, "parser":Lmiui/core/ManifestParser;
    if-gtz v5, :cond_1

    .line 81
    const-string v11, "miui_manifest"

    const-string v12, "xml"

    iget-object v13, p0, Landroid/content/pm/PackageParser$Package;->packageName:Ljava/lang/String;

    invoke-virtual {v7, v11, v12, v13}, Landroid/content/res/MiuiResources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    .line 84
    :cond_1
    if-lez v5, :cond_2

    .line 85
    invoke-virtual {v7, v5}, Landroid/content/res/MiuiResources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v11

    invoke-static {v7, v11}, Lmiui/core/ManifestParser;->createFromXmlParser(Landroid/content/res/Resources;Landroid/content/res/XmlResourceParser;)Lmiui/core/ManifestParser;

    move-result-object v6

    .line 91
    const/4 v11, 0x0

    invoke-virtual {v6, v11}, Lmiui/core/ManifestParser;->parse(Ljava/util/Map;)Lmiui/core/Manifest;

    move-result-object v4

    .line 92
    .local v4, "manifest":Lmiui/core/Manifest;
    new-instance v3, Lmiui/core/CompatibleManager;

    iget-object v11, p1, Lcom/android/server/pm/PackageManagerService;->mContext:Landroid/content/Context;

    invoke-direct {v3, v11, v4}, Lmiui/core/CompatibleManager;-><init>(Landroid/content/Context;Lmiui/core/Manifest;)V

    .line 93
    .local v3, "cptmgr":Lmiui/core/CompatibleManager;
    invoke-virtual {v3}, Lmiui/core/CompatibleManager;->isCompatible()Z

    move-result v11

    if-eqz v11, :cond_3

    .line 103
    .end local v0    # "assmgr":Landroid/content/res/AssetManager;
    .end local v2    # "cookie":I
    .end local v3    # "cptmgr":Lmiui/core/CompatibleManager;
    .end local v4    # "manifest":Lmiui/core/Manifest;
    .end local v6    # "parser":Lmiui/core/ManifestParser;
    .end local v7    # "res":Landroid/content/res/MiuiResources;
    :cond_2
    :goto_0
    return v9

    .line 98
    .restart local v0    # "assmgr":Landroid/content/res/AssetManager;
    .restart local v2    # "cookie":I
    :cond_3
    const/16 v9, -0x33

    iput v9, p1, Lcom/android/server/pm/PackageManagerService;->mLastScanError:I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move v9, v10

    .line 99
    goto :goto_0

    .line 100
    .end local v0    # "assmgr":Landroid/content/res/AssetManager;
    .end local v2    # "cookie":I
    :catch_0
    move-exception v8

    .line 101
    .local v8, "th":Ljava/lang/Throwable;
    const-string v9, "PackageManager"

    invoke-virtual {v8}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v9, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    const/16 v9, -0x34

    iput v9, p1, Lcom/android/server/pm/PackageManagerService;->mLastScanError:I

    move v9, v10

    .line 103
    goto :goto_0
.end method

.method static returnPackageDeletedResultToObserver(Ljava/lang/Object;Ljava/lang/String;I)V
    .locals 1
    .param p0, "observer"    # Ljava/lang/Object;
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "result"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 50
    if-eqz p0, :cond_0

    instance-of v0, p0, Landroid/content/pm/IPackageDeleteObserver;

    if-eqz v0, :cond_0

    .line 51
    check-cast p0, Landroid/content/pm/IPackageDeleteObserver;

    .end local p0    # "observer":Ljava/lang/Object;
    invoke-interface {p0, p1, p2}, Landroid/content/pm/IPackageDeleteObserver;->packageDeleted(Ljava/lang/String;I)V

    .line 53
    :cond_0
    return-void
.end method

.method static startActivity(Landroid/app/IActivityManager;Ljava/lang/String;Landroid/content/Intent;)I
    .locals 12
    .param p0, "am"    # Landroid/app/IActivityManager;
    .param p1, "callingPackage"    # Ljava/lang/String;
    .param p2, "intent"    # Landroid/content/Intent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    const/4 v1, 0x0

    .line 61
    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, v1

    move-object v5, v1

    move-object v6, v1

    move v8, v7

    move-object v9, v1

    move-object v10, v1

    move-object v11, v1

    invoke-interface/range {v0 .. v11}, Landroid/app/IActivityManager;->startActivity(Landroid/app/IApplicationThread;Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;Landroid/os/IBinder;Ljava/lang/String;IILjava/lang/String;Landroid/os/ParcelFileDescriptor;Landroid/os/Bundle;)I

    move-result v0

    return v0
.end method
