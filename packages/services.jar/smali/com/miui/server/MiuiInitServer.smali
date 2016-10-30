.class public Lcom/miui/server/MiuiInitServer;
.super Lmiui/os/IMiuiInit$Stub;
.source "MiuiInitServer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/server/MiuiInitServer$1;,
        Lcom/miui/server/MiuiInitServer$InitCustEnvironmentTask;,
        Lcom/miui/server/MiuiInitServer$BootCompletedReceiver;
    }
.end annotation


# static fields
.field private static final CUST_DIR_NAME:Ljava/lang/String; = "cust"

.field private static final CUST_PROPERTIES_FILE_NAME:Ljava/lang/String; = "cust.prop"

.field private static final CUST_VARIANT_FILE_NAME:Ljava/lang/String; = "cust_variant"

.field private static final DATA_MIUI_CURRRENT_PATH:Ljava/lang/String; = "/data/miui/current"

.field private static final PREINSTALL_APP_HISTORY_FILE:Ljava/lang/String; = "/data/app/preinstall_history"

.field private static final TAG:Ljava/lang/String; = "MiuiInitServer"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mDoing:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 41
    invoke-direct {p0}, Lmiui/os/IMiuiInit$Stub;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/miui/server/MiuiInitServer;->mContext:Landroid/content/Context;

    .line 44
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 45
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.BOOT_COMPLETED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 46
    iget-object v1, p0, Lcom/miui/server/MiuiInitServer;->mContext:Landroid/content/Context;

    new-instance v2, Lcom/miui/server/MiuiInitServer$BootCompletedReceiver;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/miui/server/MiuiInitServer$BootCompletedReceiver;-><init>(Lcom/miui/server/MiuiInitServer;Lcom/miui/server/MiuiInitServer$1;)V

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 49
    invoke-static {}, Lmiui/util/MiuiFeatureUtils;->setMiuisdkProperties()V

    .line 50
    return-void
.end method

.method static synthetic access$102(Lcom/miui/server/MiuiInitServer;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/miui/server/MiuiInitServer;
    .param p1, "x1"    # Z

    .prologue
    .line 31
    iput-boolean p1, p0, Lcom/miui/server/MiuiInitServer;->mDoing:Z

    return p1
.end method

.method static synthetic access$200(Lcom/miui/server/MiuiInitServer;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/miui/server/MiuiInitServer;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/miui/server/MiuiInitServer;->mContext:Landroid/content/Context;

    return-object v0
.end method


# virtual methods
.method public doFactoryReset(Z)V
    .locals 2
    .param p1, "keepUserApps"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 276
    sget-boolean v1, Lmiui/os/Build;->IS_GLOBAL_BUILD:Z

    if-eqz v1, :cond_0

    .line 277
    new-instance v0, Ljava/io/File;

    const-string v1, "/data/miui/current"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 278
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 279
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 282
    .end local v0    # "file":Ljava/io/File;
    :cond_0
    if-nez p1, :cond_1

    .line 283
    new-instance v0, Ljava/io/File;

    const-string v1, "/data/app/preinstall_history"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 284
    .restart local v0    # "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 285
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 288
    .end local v0    # "file":Ljava/io/File;
    :cond_1
    return-void
.end method

.method public getCustVariants()[Ljava/lang/String;
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 251
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 252
    .local v11, "regionList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v4, Ljava/io/File;

    invoke-static {}, Lmiui/os/Environment;->getMiuiDataDirectory()Ljava/io/File;

    move-result-object v13

    const-string v14, "cust"

    invoke-direct {v4, v13, v14}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 253
    .local v4, "cust":Ljava/io/File;
    invoke-static {}, Ljava/util/Locale;->getISOCountries()[Ljava/lang/String;

    move-result-object v3

    .line 255
    .local v3, "cs":[Ljava/lang/String;
    invoke-virtual {v4}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v12

    .line 256
    .local v12, "resgions":[Ljava/io/File;
    if-eqz v12, :cond_3

    .line 257
    move-object v0, v12

    .local v0, "arr$":[Ljava/io/File;
    array-length v7, v0

    .local v7, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    move v6, v5

    .end local v0    # "arr$":[Ljava/io/File;
    .end local v5    # "i$":I
    .end local v7    # "len$":I
    .local v6, "i$":I
    :goto_0
    if-ge v6, v7, :cond_3

    aget-object v10, v0, v6

    .line 258
    .local v10, "region":Ljava/io/File;
    invoke-virtual {v10}, Ljava/io/File;->isDirectory()Z

    move-result v13

    if-nez v13, :cond_1

    .line 257
    .end local v6    # "i$":I
    :cond_0
    add-int/lit8 v5, v6, 0x1

    .restart local v5    # "i$":I
    move v6, v5

    .end local v5    # "i$":I
    .restart local v6    # "i$":I
    goto :goto_0

    .line 262
    :cond_1
    invoke-virtual {v10}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v9

    .line 263
    .local v9, "r":Ljava/lang/String;
    move-object v1, v3

    .local v1, "arr$":[Ljava/lang/String;
    array-length v8, v1

    .local v8, "len$":I
    const/4 v5, 0x0

    .end local v6    # "i$":I
    .restart local v5    # "i$":I
    :goto_1
    if-ge v5, v8, :cond_0

    aget-object v2, v1, v5

    .line 264
    .local v2, "c":Ljava/lang/String;
    invoke-virtual {v2, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 265
    invoke-virtual {v11, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 263
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 271
    .end local v1    # "arr$":[Ljava/lang/String;
    .end local v2    # "c":Ljava/lang/String;
    .end local v5    # "i$":I
    .end local v8    # "len$":I
    .end local v9    # "r":Ljava/lang/String;
    .end local v10    # "region":Ljava/io/File;
    :cond_3
    const/4 v13, 0x0

    new-array v13, v13, [Ljava/lang/String;

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v13

    check-cast v13, [Ljava/lang/String;

    return-object v13
.end method

.method public initCustEnvironment(Ljava/lang/String;Lmiui/os/IMiuiInitObserver;)Z
    .locals 5
    .param p1, "custVariant"    # Ljava/lang/String;
    .param p2, "obs"    # Lmiui/os/IMiuiInitObserver;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 222
    iget-object v2, p0, Lcom/miui/server/MiuiInitServer;->mContext:Landroid/content/Context;

    const-string v3, "miui.os.permisson.INIT_MIUI_ENVIRONMENT"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 224
    const-string v2, "MiuiInitServer"

    const-string v3, "check status"

    invoke-static {v2, v3}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 225
    monitor-enter p0

    .line 226
    :try_start_0
    iget-boolean v2, p0, Lcom/miui/server/MiuiInitServer;->mDoing:Z

    if-eqz v2, :cond_0

    .line 227
    const-string v1, "MiuiInitServer"

    const-string v2, "skip, initializing cust environment"

    invoke-static {v1, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    monitor-exit p0

    .line 237
    :goto_0
    return v0

    .line 230
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 231
    const-string v1, "MiuiInitServer"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "skip, cust variant["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] is empty"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 232
    monitor-exit p0

    goto :goto_0

    .line 238
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 234
    :cond_1
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lcom/miui/server/MiuiInitServer;->mDoing:Z

    .line 235
    const-string v0, "MiuiInitServer"

    const-string v2, "initializing cust environment"

    invoke-static {v0, v2}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 236
    new-instance v0, Lcom/miui/server/MiuiInitServer$InitCustEnvironmentTask;

    invoke-direct {v0, p0, p1, p2}, Lcom/miui/server/MiuiInitServer$InitCustEnvironmentTask;-><init>(Lcom/miui/server/MiuiInitServer;Ljava/lang/String;Lmiui/os/IMiuiInitObserver;)V

    invoke-virtual {v0}, Lcom/miui/server/MiuiInitServer$InitCustEnvironmentTask;->start()V

    .line 237
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move v0, v1

    goto :goto_0
.end method

.method public installPreinstallApp()V
    .locals 3

    .prologue
    .line 244
    iget-object v0, p0, Lcom/miui/server/MiuiInitServer;->mContext:Landroid/content/Context;

    const-string v1, "miui.os.permisson.INIT_MIUI_ENVIRONMENT"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 246
    invoke-static {}, Lcom/android/server/pm/PreinstallApp;->installCustApps()V

    .line 247
    return-void
.end method
