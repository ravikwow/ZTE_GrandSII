.class Lcom/android/server/pm/PackageManagerProxy;
.super Ljava/lang/Object;
.source "PackageManagerProxy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/pm/PackageManagerProxy$1;,
        Lcom/android/server/pm/PackageManagerProxy$PackageInstallObserver;,
        Lcom/android/server/pm/PackageManagerProxy$PackageDeleteObserver;
    }
.end annotation


# static fields
.field private static final INSTALL_TIME_OUT:J = 0x493e0L

.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    const-class v0, Lcom/android/server/pm/PackageManagerProxy;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/server/pm/PackageManagerProxy;->TAG:Ljava/lang/String;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    return-void
.end method

.method static cleanUpResource(Lcom/android/server/pm/PackageManagerService;Lcom/android/server/pm/PackageSetting;)Z
    .locals 11
    .param p0, "pms"    # Lcom/android/server/pm/PackageManagerService;
    .param p1, "ps"    # Lcom/android/server/pm/PackageSetting;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 123
    const/4 v1, 0x0

    .line 127
    .local v1, "args":Lcom/android/server/pm/PackageManagerService$InstallArgs;
    :try_start_0
    const-string v4, "packageFlagsToInstallFlags"

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object p1, v8, v9

    invoke-static {p0, v4, v7, v8}, Lmiui/util/ReflectionUtils;->callMethod(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 128
    .local v2, "flags":I
    const-string v4, "createInstallArgs"

    const-class v7, Lcom/android/server/pm/PackageManagerService$InstallArgs;

    const/4 v8, 0x4

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    iget-object v10, p1, Lcom/android/server/pm/PackageSetting;->codePathString:Ljava/lang/String;

    aput-object v10, v8, v9

    const/4 v9, 0x2

    iget-object v10, p1, Lcom/android/server/pm/PackageSetting;->resourcePathString:Ljava/lang/String;

    aput-object v10, v8, v9

    const/4 v9, 0x3

    iget-object v10, p1, Lcom/android/server/pm/PackageSetting;->nativeLibraryPathString:Ljava/lang/String;

    aput-object v10, v8, v9

    invoke-static {p0, v4, v7, v8}, Lmiui/util/ReflectionUtils;->callMethod(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Lcom/android/server/pm/PackageManagerService$InstallArgs;

    move-object v1, v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 137
    if-nez v1, :cond_0

    move v4, v5

    .line 143
    .end local v2    # "flags":I
    :goto_0
    return v4

    .line 133
    :catch_0
    move-exception v3

    .line 134
    .local v3, "t":Ljava/lang/Throwable;
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    move v4, v5

    .line 135
    goto :goto_0

    .line 140
    .end local v3    # "t":Ljava/lang/Throwable;
    .restart local v2    # "flags":I
    :cond_0
    iget-object v5, p0, Lcom/android/server/pm/PackageManagerService;->mInstallLock:Ljava/lang/Object;

    monitor-enter v5

    .line 141
    :try_start_1
    invoke-virtual {v1}, Lcom/android/server/pm/PackageManagerService$InstallArgs;->cleanUpResourcesLI()V

    .line 142
    monitor-exit v5

    move v4, v6

    .line 143
    goto :goto_0

    .line 142
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v4
.end method

.method static copyOdexFileIfExists(Ljava/io/File;Ljava/io/File;)V
    .locals 7
    .param p0, "apkFile"    # Ljava/io/File;
    .param p1, "dstCodePath"    # Ljava/io/File;

    .prologue
    const/4 v1, 0x1

    const/4 v3, 0x0

    .line 147
    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    const-string v5, ".apk"

    const-string v6, ".odex"

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 148
    .local v2, "srcOdexFile":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 149
    new-instance v0, Ljava/io/File;

    const-string v4, "/data/app/"

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    .local v0, "dstOdexFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 151
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 153
    :cond_0
    invoke-static {v2, v0}, Landroid/os/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {v0, v1, v3}, Ljava/io/File;->setReadable(ZZ)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 154
    .local v1, "ret":Z
    :goto_0
    if-eqz v1, :cond_1

    .line 155
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 158
    .end local v0    # "dstOdexFile":Ljava/io/File;
    .end local v1    # "ret":Z
    :cond_1
    return-void

    .restart local v0    # "dstOdexFile":Ljava/io/File;
    :cond_2
    move v1, v3

    .line 153
    goto :goto_0
.end method

.method static deleteApp(Landroid/content/pm/IPackageManager;Ljava/lang/String;Z)Z
    .locals 5
    .param p0, "pm"    # Landroid/content/pm/IPackageManager;
    .param p1, "pkgName"    # Ljava/lang/String;
    .param p2, "keepData"    # Z

    .prologue
    .line 82
    const/4 v1, 0x2

    .line 83
    .local v1, "flags":I
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x10

    if-gt v3, v4, :cond_0

    .line 85
    const/4 v1, 0x0

    .line 87
    :cond_0
    if-eqz p2, :cond_1

    .line 88
    or-int/lit8 v1, v1, 0x1

    .line 90
    :cond_1
    new-instance v2, Lcom/android/server/pm/PackageManagerProxy$PackageDeleteObserver;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/android/server/pm/PackageManagerProxy$PackageDeleteObserver;-><init>(Lcom/android/server/pm/PackageManagerProxy$1;)V

    .line 92
    .local v2, "obs":Lcom/android/server/pm/PackageManagerProxy$PackageDeleteObserver;
    const/4 v3, 0x0

    :try_start_0
    invoke-interface {p0, p1, v2, v3, v1}, Landroid/content/pm/IPackageManager;->deletePackageAsUser(Ljava/lang/String;Landroid/content/pm/IPackageDeleteObserver;II)V

    .line 93
    monitor-enter v2
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1

    .line 94
    :goto_0
    :try_start_1
    iget-boolean v3, v2, Lcom/android/server/pm/PackageManagerProxy$PackageDeleteObserver;->finished:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v3, :cond_2

    .line 96
    :try_start_2
    invoke-virtual {v2}, Ljava/lang/Object;->wait()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 97
    :catch_0
    move-exception v3

    goto :goto_0

    .line 100
    :cond_2
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 104
    :goto_1
    iget-boolean v3, v2, Lcom/android/server/pm/PackageManagerProxy$PackageDeleteObserver;->result:Z

    return v3

    .line 100
    :catchall_0
    move-exception v3

    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw v3
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_1

    .line 101
    :catch_1
    move-exception v0

    .line 102
    .local v0, "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_1
.end method

.method static doRenameApk(Ljava/io/File;Ljava/lang/String;I)V
    .locals 4
    .param p0, "codeFile"    # Ljava/io/File;
    .param p1, "originName"    # Ljava/lang/String;
    .param p2, "installFlags"    # I

    .prologue
    .line 162
    and-int/lit16 v2, p2, 0x200

    if-eqz v2, :cond_0

    .line 163
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    const-string v3, "base.apk"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    .local v1, "baseApk":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 165
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    .local v0, "afterApk":Ljava/io/File;
    invoke-virtual {v1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 169
    .end local v0    # "afterApk":Ljava/io/File;
    .end local v1    # "baseApk":Ljava/io/File;
    :cond_0
    return-void
.end method

.method static installApp(Landroid/content/pm/IPackageManager;Ljava/io/File;)I
    .locals 7
    .param p0, "pm"    # Landroid/content/pm/IPackageManager;
    .param p1, "apkFile"    # Ljava/io/File;

    .prologue
    .line 52
    invoke-static {p1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    .line 53
    .local v3, "uri":Landroid/net/Uri;
    new-instance v2, Lcom/android/server/pm/PackageManagerProxy$PackageInstallObserver;

    const/4 v4, 0x0

    invoke-direct {v2, v4}, Lcom/android/server/pm/PackageManagerProxy$PackageInstallObserver;-><init>(Lcom/android/server/pm/PackageManagerProxy$1;)V

    .line 56
    .local v2, "obs":Lcom/android/server/pm/PackageManagerProxy$PackageInstallObserver;
    const/16 v1, 0x40

    .line 57
    .local v1, "flags":I
    :try_start_0
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x10

    if-gt v4, v5, :cond_0

    .line 59
    const/4 v1, 0x0

    .line 61
    :cond_0
    or-int/lit8 v1, v1, 0x2

    .line 62
    const-string v4, "system"

    invoke-interface {p0, v3, v2, v1, v4}, Landroid/content/pm/IPackageManager;->installPackage(Landroid/net/Uri;Landroid/content/pm/IPackageInstallObserver;ILjava/lang/String;)V

    .line 63
    monitor-enter v2
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1

    .line 64
    :cond_1
    :goto_0
    :try_start_1
    iget-boolean v4, v2, Lcom/android/server/pm/PackageManagerProxy$PackageInstallObserver;->finished:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v4, :cond_2

    .line 66
    const-wide/32 v4, 0x493e0

    :try_start_2
    invoke-virtual {v2, v4, v5}, Ljava/lang/Object;->wait(J)V

    .line 67
    iget-boolean v4, v2, Lcom/android/server/pm/PackageManagerProxy$PackageInstallObserver;->finished:Z

    if-nez v4, :cond_1

    .line 68
    sget-object v4, Lcom/android/server/pm/PackageManagerProxy;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Install "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " timeout"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 70
    :catch_0
    move-exception v4

    goto :goto_0

    .line 73
    :cond_2
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 77
    :goto_1
    iget v4, v2, Lcom/android/server/pm/PackageManagerProxy$PackageInstallObserver;->result:I

    return v4

    .line 73
    :catchall_0
    move-exception v4

    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw v4
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_1

    .line 74
    :catch_1
    move-exception v0

    .line 75
    .local v0, "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_1
.end method

.method static parsePackage(Ljava/io/File;)Landroid/content/pm/PackageParser$Package;
    .locals 5
    .param p0, "apkFile"    # Ljava/io/File;

    .prologue
    .line 108
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 109
    .local v0, "apkPath":Ljava/lang/String;
    const/4 v1, 0x4

    .line 110
    .local v1, "parseFlags":I
    new-instance v3, Landroid/content/pm/PackageParser;

    invoke-direct {v3, v0}, Landroid/content/pm/PackageParser;-><init>(Ljava/lang/String;)V

    .line 111
    .local v3, "pp":Landroid/content/pm/PackageParser;
    const/4 v4, 0x0

    invoke-virtual {v3, p0, v0, v4, v1}, Landroid/content/pm/PackageParser;->parsePackage(Ljava/io/File;Ljava/lang/String;Landroid/util/DisplayMetrics;I)Landroid/content/pm/PackageParser$Package;

    move-result-object v2

    .line 112
    .local v2, "pkg":Landroid/content/pm/PackageParser$Package;
    if-eqz v2, :cond_0

    .line 113
    invoke-virtual {v3, v2, v1}, Landroid/content/pm/PackageParser;->collectCertificates(Landroid/content/pm/PackageParser$Package;I)Z

    .line 115
    :cond_0
    return-object v2
.end method

.method static parsePackageLite(Ljava/io/File;)Landroid/content/pm/PackageParser$PackageLite;
    .locals 2
    .param p0, "apkFile"    # Ljava/io/File;

    .prologue
    .line 119
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/content/pm/PackageParser;->parsePackageLite(Ljava/lang/String;I)Landroid/content/pm/PackageParser$PackageLite;

    move-result-object v0

    return-object v0
.end method
