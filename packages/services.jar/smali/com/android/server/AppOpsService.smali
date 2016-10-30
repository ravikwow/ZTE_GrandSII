.class public Lcom/android/server/AppOpsService;
.super Lcom/android/internal/app/IAppOpsService$Stub;
.source "AppOpsService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/AppOpsService$ClientState;,
        Lcom/android/server/AppOpsService$Callback;,
        Lcom/android/server/AppOpsService$Op;,
        Lcom/android/server/AppOpsService$Ops;
    }
.end annotation


# static fields
.field static final DEBUG:Z = false

.field static final TAG:Ljava/lang/String; = "AppOps"

.field static final WRITE_DELAY:J = 0x1b7740L

.field static final WRITE_DELAY_INTERNAL:J = 0x3e8L


# instance fields
.field mCallbackBinder:Lcom/android/internal/app/IOpsCallback;

.field final mClients:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap",
            "<",
            "Landroid/os/IBinder;",
            "Lcom/android/server/AppOpsService$ClientState;",
            ">;"
        }
    .end annotation
.end field

.field mContext:Landroid/content/Context;

.field final mFile:Landroid/util/AtomicFile;

.field final mHandler:Landroid/os/Handler;

.field final mModeWatchers:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap",
            "<",
            "Landroid/os/IBinder;",
            "Lcom/android/server/AppOpsService$Callback;",
            ">;"
        }
    .end annotation
.end field

.field final mOpModeWatchers:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/AppOpsService$Callback;",
            ">;>;"
        }
    .end annotation
.end field

.field final mPackageModeWatchers:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/AppOpsService$Callback;",
            ">;>;"
        }
    .end annotation
.end field

.field final mUidOps:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/android/server/AppOpsService$Ops;",
            ">;>;"
        }
    .end annotation
.end field

.field final mWriteRunner:Ljava/lang/Runnable;

.field mWriteScheduled:Z


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .param p1, "storagePath"    # Ljava/io/File;

    .prologue
    .line 198
    invoke-direct {p0}, Lcom/android/internal/app/IAppOpsService$Stub;-><init>()V

    .line 78
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/AppOpsService;->mCallbackBinder:Lcom/android/internal/app/IOpsCallback;

    .line 83
    new-instance v0, Lcom/android/server/AppOpsService$1;

    invoke-direct {v0, p0}, Lcom/android/server/AppOpsService$1;-><init>(Lcom/android/server/AppOpsService;)V

    iput-object v0, p0, Lcom/android/server/AppOpsService;->mWriteRunner:Ljava/lang/Runnable;

    .line 98
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    .line 129
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/server/AppOpsService;->mOpModeWatchers:Landroid/util/SparseArray;

    .line 131
    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/AppOpsService;->mPackageModeWatchers:Landroid/util/ArrayMap;

    .line 133
    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/AppOpsService;->mModeWatchers:Landroid/util/ArrayMap;

    .line 157
    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/AppOpsService;->mClients:Landroid/util/ArrayMap;

    .line 199
    new-instance v0, Landroid/util/AtomicFile;

    invoke-direct {v0, p1}, Landroid/util/AtomicFile;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lcom/android/server/AppOpsService;->mFile:Landroid/util/AtomicFile;

    .line 200
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/android/server/AppOpsService;->mHandler:Landroid/os/Handler;

    .line 201
    invoke-virtual {p0}, Lcom/android/server/AppOpsService;->readState()V

    .line 202
    return-void
.end method

.method private static addCallbacks(Ljava/util/HashMap;Ljava/lang/String;ILjava/util/ArrayList;)Ljava/util/HashMap;
    .locals 5
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "op"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Lcom/android/server/AppOpsService$Callback;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;>;>;",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/AppOpsService$Callback;",
            ">;)",
            "Ljava/util/HashMap",
            "<",
            "Lcom/android/server/AppOpsService$Callback;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;>;>;"
        }
    .end annotation

    .prologue
    .line 408
    .local p0, "callbacks":Ljava/util/HashMap;, "Ljava/util/HashMap<Lcom/android/server/AppOpsService$Callback;Ljava/util/ArrayList<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Integer;>;>;>;"
    .local p3, "cbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    if-nez p3, :cond_1

    .line 423
    :cond_0
    return-object p0

    .line 411
    :cond_1
    if-nez p0, :cond_2

    .line 412
    new-instance p0, Ljava/util/HashMap;

    .end local p0    # "callbacks":Ljava/util/HashMap;, "Ljava/util/HashMap<Lcom/android/server/AppOpsService$Callback;Ljava/util/ArrayList<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Integer;>;>;>;"
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 414
    .restart local p0    # "callbacks":Ljava/util/HashMap;, "Ljava/util/HashMap<Lcom/android/server/AppOpsService$Callback;Ljava/util/ArrayList<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Integer;>;>;>;"
    :cond_2
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 415
    invoke-virtual {p3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/AppOpsService$Callback;

    .line 416
    .local v0, "cb":Lcom/android/server/AppOpsService$Callback;
    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 417
    .local v2, "reports":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Integer;>;>;"
    if-nez v2, :cond_3

    .line 418
    new-instance v2, Ljava/util/ArrayList;

    .end local v2    # "reports":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Integer;>;>;"
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 419
    .restart local v2    # "reports":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Integer;>;>;"
    invoke-virtual {p0, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 421
    :cond_3
    new-instance v3, Landroid/util/Pair;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v3, p1, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 414
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private askOperationLocked(IILjava/lang/String;)I
    .locals 2
    .param p1, "code"    # I
    .param p2, "uid"    # I
    .param p3, "packageName"    # Ljava/lang/String;

    .prologue
    .line 1236
    const/4 v0, 0x0

    .line 1237
    .local v0, "result":I
    iget-object v1, p0, Lcom/android/server/AppOpsService;->mCallbackBinder:Lcom/android/internal/app/IOpsCallback;

    if-eqz v1, :cond_0

    .line 1239
    :try_start_0
    iget-object v1, p0, Lcom/android/server/AppOpsService;->mCallbackBinder:Lcom/android/internal/app/IOpsCallback;

    invoke-interface {v1, p2, p3, p1}, Lcom/android/internal/app/IOpsCallback;->askOperation(ILjava/lang/String;I)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 1243
    :cond_0
    :goto_0
    return v0

    .line 1240
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private checkSystemApp(IILjava/lang/String;)Z
    .locals 6
    .param p1, "code"    # I
    .param p2, "uid"    # I
    .param p3, "packageName"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 775
    const/16 v4, 0x2710

    if-ge p2, v4, :cond_1

    .line 782
    :cond_0
    :goto_0
    return v2

    .line 777
    :cond_1
    :try_start_0
    iget-object v4, p0, Lcom/android/server/AppOpsService;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, p3, v5}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    .line 778
    .local v1, "info":Landroid/content/pm/ApplicationInfo;
    if-eqz v1, :cond_2

    iget v4, v1, Landroid/content/pm/ApplicationInfo;->flags:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    and-int/lit8 v4, v4, 0x1

    if-nez v4, :cond_0

    .end local v1    # "info":Landroid/content/pm/ApplicationInfo;
    :cond_2
    :goto_1
    move v2, v3

    .line 782
    goto :goto_0

    .line 779
    :catch_0
    move-exception v0

    .line 780
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method private collectOps(Lcom/android/server/AppOpsService$Ops;[I)Ljava/util/ArrayList;
    .locals 11
    .param p1, "pkgOps"    # Lcom/android/server/AppOpsService$Ops;
    .param p2, "ops"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/server/AppOpsService$Ops;",
            "[I)",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/AppOpsManager$OpEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 279
    const/4 v10, 0x0

    .line 280
    .local v10, "resOps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$OpEntry;>;"
    if-nez p2, :cond_0

    .line 281
    new-instance v10, Ljava/util/ArrayList;

    .end local v10    # "resOps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$OpEntry;>;"
    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 282
    .restart local v10    # "resOps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$OpEntry;>;"
    const/4 v9, 0x0

    .local v9, "j":I
    :goto_0
    invoke-virtual {p1}, Lcom/android/server/AppOpsService$Ops;->size()I

    move-result v0

    if-ge v9, v0, :cond_3

    .line 283
    invoke-virtual {p1, v9}, Lcom/android/server/AppOpsService$Ops;->valueAt(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/server/AppOpsService$Op;

    .line 284
    .local v8, "curOp":Lcom/android/server/AppOpsService$Op;
    new-instance v0, Landroid/app/AppOpsManager$OpEntry;

    iget v1, v8, Lcom/android/server/AppOpsService$Op;->op:I

    iget v2, v8, Lcom/android/server/AppOpsService$Op;->mode:I

    iget-wide v3, v8, Lcom/android/server/AppOpsService$Op;->time:J

    iget-wide v5, v8, Lcom/android/server/AppOpsService$Op;->rejectTime:J

    iget v7, v8, Lcom/android/server/AppOpsService$Op;->duration:I

    invoke-direct/range {v0 .. v7}, Landroid/app/AppOpsManager$OpEntry;-><init>(IIJJI)V

    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 282
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 288
    .end local v8    # "curOp":Lcom/android/server/AppOpsService$Op;
    .end local v9    # "j":I
    :cond_0
    const/4 v9, 0x0

    .restart local v9    # "j":I
    :goto_1
    array-length v0, p2

    if-ge v9, v0, :cond_3

    .line 289
    aget v0, p2, v9

    invoke-virtual {p1, v0}, Lcom/android/server/AppOpsService$Ops;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/server/AppOpsService$Op;

    .line 290
    .restart local v8    # "curOp":Lcom/android/server/AppOpsService$Op;
    if-eqz v8, :cond_2

    .line 291
    if-nez v10, :cond_1

    .line 292
    new-instance v10, Ljava/util/ArrayList;

    .end local v10    # "resOps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$OpEntry;>;"
    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 294
    .restart local v10    # "resOps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$OpEntry;>;"
    :cond_1
    new-instance v0, Landroid/app/AppOpsManager$OpEntry;

    iget v1, v8, Lcom/android/server/AppOpsService$Op;->op:I

    iget v2, v8, Lcom/android/server/AppOpsService$Op;->mode:I

    iget-wide v3, v8, Lcom/android/server/AppOpsService$Op;->time:J

    iget-wide v5, v8, Lcom/android/server/AppOpsService$Op;->rejectTime:J

    iget v7, v8, Lcom/android/server/AppOpsService$Op;->duration:I

    invoke-direct/range {v0 .. v7}, Landroid/app/AppOpsManager$OpEntry;-><init>(IIJJI)V

    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 288
    :cond_2
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 299
    .end local v8    # "curOp":Lcom/android/server/AppOpsService$Op;
    :cond_3
    return-object v10
.end method

.method private getDefaultMode(IILjava/lang/String;)I
    .locals 1
    .param p1, "code"    # I
    .param p2, "uid"    # I
    .param p3, "packageName"    # Ljava/lang/String;

    .prologue
    .line 1217
    sget-boolean v0, Lmiui/os/Build;->IS_CTS_BUILD:Z

    if-eqz v0, :cond_0

    .line 1218
    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroid/app/AppOpsManager;->opToDefaultMode(IZ)I

    move-result v0

    .line 1220
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    invoke-static {p1, v0}, Landroid/app/AppOpsManager;->opToDefaultMode(IZ)I

    move-result v0

    goto :goto_0
.end method

.method private getOpLocked(IILjava/lang/String;Z)Lcom/android/server/AppOpsService$Op;
    .locals 2
    .param p1, "code"    # I
    .param p2, "uid"    # I
    .param p3, "packageName"    # Ljava/lang/String;
    .param p4, "edit"    # Z

    .prologue
    .line 881
    invoke-direct {p0, p2, p3, p4}, Lcom/android/server/AppOpsService;->getOpsLocked(ILjava/lang/String;Z)Lcom/android/server/AppOpsService$Ops;

    move-result-object v0

    .line 882
    .local v0, "ops":Lcom/android/server/AppOpsService$Ops;
    if-nez v0, :cond_0

    .line 883
    const/4 v1, 0x0

    .line 885
    :goto_0
    return-object v1

    :cond_0
    invoke-direct {p0, v0, p1, p4}, Lcom/android/server/AppOpsService;->getOpLocked(Lcom/android/server/AppOpsService$Ops;IZ)Lcom/android/server/AppOpsService$Op;

    move-result-object v1

    goto :goto_0
.end method

.method private getOpLocked(Lcom/android/server/AppOpsService$Ops;IZ)Lcom/android/server/AppOpsService$Op;
    .locals 5
    .param p1, "ops"    # Lcom/android/server/AppOpsService$Ops;
    .param p2, "code"    # I
    .param p3, "edit"    # Z

    .prologue
    .line 889
    invoke-virtual {p1, p2}, Lcom/android/server/AppOpsService$Ops;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/AppOpsService$Op;

    .line 890
    .local v1, "op":Lcom/android/server/AppOpsService$Op;
    if-nez v1, :cond_2

    .line 891
    if-nez p3, :cond_0

    .line 892
    const/4 v3, 0x0

    .line 903
    :goto_0
    return-object v3

    .line 894
    :cond_0
    iget v3, p1, Lcom/android/server/AppOpsService$Ops;->uid:I

    iget-object v4, p1, Lcom/android/server/AppOpsService$Ops;->packageName:Ljava/lang/String;

    invoke-direct {p0, p2, v3, v4}, Lcom/android/server/AppOpsService;->getDefaultMode(IILjava/lang/String;)I

    move-result v0

    .line 895
    .local v0, "mode":I
    iget v3, p1, Lcom/android/server/AppOpsService$Ops;->uid:I

    iget-object v4, p1, Lcom/android/server/AppOpsService$Ops;->packageName:Ljava/lang/String;

    invoke-direct {p0, p2, v3, v4}, Lcom/android/server/AppOpsService;->getSuggestMode(IILjava/lang/String;)I

    move-result v2

    .line 896
    .local v2, "suggestMode":I
    const/4 v3, -0x1

    if-eq v2, v3, :cond_1

    move v0, v2

    .line 897
    :cond_1
    new-instance v1, Lcom/android/server/AppOpsService$Op;

    .end local v1    # "op":Lcom/android/server/AppOpsService$Op;
    iget v3, p1, Lcom/android/server/AppOpsService$Ops;->uid:I

    iget-object v4, p1, Lcom/android/server/AppOpsService$Ops;->packageName:Ljava/lang/String;

    invoke-direct {v1, v3, v4, p2, v0}, Lcom/android/server/AppOpsService$Op;-><init>(ILjava/lang/String;II)V

    .line 898
    .restart local v1    # "op":Lcom/android/server/AppOpsService$Op;
    invoke-virtual {p1, p2, v1}, Lcom/android/server/AppOpsService$Ops;->put(ILjava/lang/Object;)V

    .line 900
    .end local v0    # "mode":I
    .end local v2    # "suggestMode":I
    :cond_2
    if-eqz p3, :cond_3

    .line 901
    invoke-direct {p0}, Lcom/android/server/AppOpsService;->scheduleWriteLocked()V

    :cond_3
    move-object v3, v1

    .line 903
    goto :goto_0
.end method

.method private getOpsLocked(ILjava/lang/String;Z)Lcom/android/server/AppOpsService$Ops;
    .locals 10
    .param p1, "uid"    # I
    .param p2, "packageName"    # Ljava/lang/String;
    .param p3, "edit"    # Z

    .prologue
    const/4 v6, 0x0

    .line 815
    iget-object v7, p0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    invoke-virtual {v7, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    .line 816
    .local v4, "pkgOps":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;"
    if-nez v4, :cond_2

    .line 817
    if-nez p3, :cond_1

    move-object v3, v6

    .line 863
    :cond_0
    :goto_0
    return-object v3

    .line 820
    :cond_1
    new-instance v4, Ljava/util/HashMap;

    .end local v4    # "pkgOps":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;"
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 821
    .restart local v4    # "pkgOps":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;"
    iget-object v7, p0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    invoke-virtual {v7, p1, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 823
    :cond_2
    if-nez p1, :cond_4

    .line 824
    const-string p2, "root"

    .line 830
    :cond_3
    :goto_1
    invoke-virtual {v4, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/AppOpsService$Ops;

    .line 831
    .local v3, "ops":Lcom/android/server/AppOpsService$Ops;
    if-nez v3, :cond_0

    .line 832
    if-nez p3, :cond_6

    move-object v3, v6

    .line 833
    goto :goto_0

    .line 825
    .end local v3    # "ops":Lcom/android/server/AppOpsService$Ops;
    :cond_4
    const/16 v7, 0x7d0

    if-ne p1, v7, :cond_5

    .line 826
    const-string p2, "com.android.shell"

    goto :goto_1

    .line 827
    :cond_5
    const/16 v7, 0x3e8

    if-ne p1, v7, :cond_3

    if-nez p2, :cond_3

    .line 828
    const-string p2, "android"

    goto :goto_1

    .line 837
    .restart local v3    # "ops":Lcom/android/server/AppOpsService$Ops;
    :cond_6
    if-eqz p1, :cond_9

    .line 838
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v1

    .line 840
    .local v1, "ident":J
    const/4 v5, -0x1

    .line 842
    .local v5, "pkgUid":I
    :try_start_0
    iget-object v7, p0, Lcom/android/server/AppOpsService;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    invoke-static {p1}, Landroid/os/UserHandle;->getUserId(I)I

    move-result v8

    invoke-virtual {v7, p2, v8}, Landroid/content/pm/PackageManager;->getPackageUid(Ljava/lang/String;I)I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v5

    .line 849
    :cond_7
    :goto_2
    if-eq v5, p1, :cond_8

    .line 852
    :try_start_1
    const-string v7, "AppOps"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Bad call: specified package "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " under uid "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " but it is really "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 857
    invoke-static {v1, v2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    move-object v3, v6

    goto :goto_0

    .line 844
    :catch_0
    move-exception v0

    .line 845
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :try_start_2
    const-string v7, "media"

    invoke-virtual {v7, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v7

    if-eqz v7, :cond_7

    .line 846
    const/16 v5, 0x3f5

    goto :goto_2

    .line 857
    .end local v0    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_8
    invoke-static {v1, v2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 860
    .end local v1    # "ident":J
    .end local v5    # "pkgUid":I
    :cond_9
    new-instance v3, Lcom/android/server/AppOpsService$Ops;

    .end local v3    # "ops":Lcom/android/server/AppOpsService$Ops;
    invoke-direct {v3, p2, p1}, Lcom/android/server/AppOpsService$Ops;-><init>(Ljava/lang/String;I)V

    .line 861
    .restart local v3    # "ops":Lcom/android/server/AppOpsService$Ops;
    invoke-virtual {v4, p2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 857
    .restart local v1    # "ident":J
    .restart local v5    # "pkgUid":I
    :catchall_0
    move-exception v6

    invoke-static {v1, v2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v6
.end method

.method private getSuggestMode(IILjava/lang/String;)I
    .locals 3
    .param p1, "code"    # I
    .param p2, "uid"    # I
    .param p3, "packageName"    # Ljava/lang/String;

    .prologue
    .line 1224
    const/4 v1, -0x1

    .line 1225
    .local v1, "result":I
    iget-object v2, p0, Lcom/android/server/AppOpsService;->mCallbackBinder:Lcom/android/internal/app/IOpsCallback;

    if-eqz v2, :cond_0

    .line 1227
    :try_start_0
    iget-object v2, p0, Lcom/android/server/AppOpsService;->mCallbackBinder:Lcom/android/internal/app/IOpsCallback;

    invoke-interface {v2, p2, p3, p1}, Lcom/android/internal/app/IOpsCallback;->getDefaultOp(ILjava/lang/String;I)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 1232
    :cond_0
    :goto_0
    return v1

    .line 1228
    :catch_0
    move-exception v0

    .line 1229
    .local v0, "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0
.end method

.method private inMiuiAllowedBlackList(I)Z
    .locals 1
    .param p1, "code"    # I

    .prologue
    .line 761
    const/4 v0, 0x0

    .line 762
    .local v0, "inList":Z
    sparse-switch p1, :sswitch_data_0

    .line 771
    :goto_0
    return v0

    .line 766
    :sswitch_0
    const/4 v0, 0x1

    .line 767
    goto :goto_0

    .line 762
    nop

    :sswitch_data_0
    .sparse-switch
        0x3 -> :sswitch_0
        0xb -> :sswitch_0
        0x1c -> :sswitch_0
    .end sparse-switch
.end method

.method private isAppPermissionControlOpen(I)Z
    .locals 2
    .param p1, "code"    # I

    .prologue
    .line 1247
    const/4 v0, 0x1

    .line 1248
    .local v0, "result":Z
    iget-object v1, p0, Lcom/android/server/AppOpsService;->mCallbackBinder:Lcom/android/internal/app/IOpsCallback;

    if-eqz v1, :cond_0

    .line 1250
    :try_start_0
    iget-object v1, p0, Lcom/android/server/AppOpsService;->mCallbackBinder:Lcom/android/internal/app/IOpsCallback;

    invoke-interface {v1, p1}, Lcom/android/internal/app/IOpsCallback;->isAppPermissionControlOpen(I)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 1254
    :cond_0
    :goto_0
    return v0

    .line 1251
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private isMiuiAllowed(IILjava/lang/String;)Z
    .locals 1
    .param p1, "code"    # I
    .param p2, "uid"    # I
    .param p3, "packageName"    # Ljava/lang/String;

    .prologue
    .line 757
    invoke-direct {p0, p1, p2, p3}, Lcom/android/server/AppOpsService;->checkSystemApp(IILjava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/android/server/AppOpsService;->inMiuiAllowedBlackList(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private onAppApplyOperation(ILjava/lang/String;IIZ)V
    .locals 6
    .param p1, "uid"    # I
    .param p2, "packageName"    # Ljava/lang/String;
    .param p3, "op"    # I
    .param p4, "mode"    # I
    .param p5, "isStartOperation"    # Z

    .prologue
    .line 1259
    iget-object v0, p0, Lcom/android/server/AppOpsService;->mCallbackBinder:Lcom/android/internal/app/IOpsCallback;

    if-eqz v0, :cond_0

    .line 1261
    :try_start_0
    iget-object v0, p0, Lcom/android/server/AppOpsService;->mCallbackBinder:Lcom/android/internal/app/IOpsCallback;

    move v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-interface/range {v0 .. v5}, Lcom/android/internal/app/IOpsCallback;->onAppApplyOperation(ILjava/lang/String;IIZ)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1265
    :cond_0
    :goto_0
    return-void

    .line 1262
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private pruneOp(Lcom/android/server/AppOpsService$Op;ILjava/lang/String;)V
    .locals 6
    .param p1, "op"    # Lcom/android/server/AppOpsService$Op;
    .param p2, "uid"    # I
    .param p3, "packageName"    # Ljava/lang/String;

    .prologue
    const-wide/16 v4, 0x0

    .line 349
    iget-wide v2, p1, Lcom/android/server/AppOpsService$Op;->time:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    iget-wide v2, p1, Lcom/android/server/AppOpsService$Op;->rejectTime:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    .line 350
    const/4 v2, 0x0

    invoke-direct {p0, p2, p3, v2}, Lcom/android/server/AppOpsService;->getOpsLocked(ILjava/lang/String;Z)Lcom/android/server/AppOpsService$Ops;

    move-result-object v0

    .line 351
    .local v0, "ops":Lcom/android/server/AppOpsService$Ops;
    if-eqz v0, :cond_0

    .line 352
    iget v2, p1, Lcom/android/server/AppOpsService$Op;->op:I

    invoke-virtual {v0, v2}, Lcom/android/server/AppOpsService$Ops;->remove(I)V

    .line 353
    invoke-virtual {v0}, Lcom/android/server/AppOpsService$Ops;->size()I

    move-result v2

    if-gtz v2, :cond_0

    .line 354
    iget-object v2, p0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    invoke-virtual {v2, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 355
    .local v1, "pkgOps":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;"
    if-eqz v1, :cond_0

    .line 356
    iget-object v2, v0, Lcom/android/server/AppOpsService$Ops;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 357
    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v2

    if-gtz v2, :cond_0

    .line 358
    iget-object v2, p0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    invoke-virtual {v2, p2}, Landroid/util/SparseArray;->remove(I)V

    .line 364
    .end local v0    # "ops":Lcom/android/server/AppOpsService$Ops;
    .end local v1    # "pkgOps":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;"
    :cond_0
    return-void
.end method

.method private scheduleWriteLocked()V
    .locals 4

    .prologue
    .line 867
    iget-boolean v0, p0, Lcom/android/server/AppOpsService;->mWriteScheduled:Z

    if-nez v0, :cond_0

    .line 868
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/AppOpsService;->mWriteScheduled:Z

    .line 869
    iget-object v0, p0, Lcom/android/server/AppOpsService;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/server/AppOpsService;->mWriteRunner:Ljava/lang/Runnable;

    const-wide/32 v2, 0x1b7740

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 871
    :cond_0
    return-void
.end method

.method private scheduleWriteNowLocked()V
    .locals 4

    .prologue
    .line 874
    iget-boolean v0, p0, Lcom/android/server/AppOpsService;->mWriteScheduled:Z

    if-nez v0, :cond_0

    .line 875
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/AppOpsService;->mWriteScheduled:Z

    .line 876
    iget-object v0, p0, Lcom/android/server/AppOpsService;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/server/AppOpsService;->mWriteRunner:Ljava/lang/Runnable;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 878
    :cond_0
    return-void
.end method

.method private verifyIncomingOp(I)V
    .locals 3
    .param p1, "op"    # I

    .prologue
    .line 808
    if-ltz p1, :cond_0

    const/16 v0, 0x3d

    if-ge p1, v0, :cond_0

    .line 809
    return-void

    .line 811
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad operation #"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private verifyIncomingUidForRead(I)V
    .locals 5
    .param p1, "uid"    # I

    .prologue
    .line 786
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v0

    if-ne p1, v0, :cond_1

    .line 794
    :cond_0
    :goto_0
    return-void

    .line 789
    :cond_1
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v0

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 792
    iget-object v0, p0, Lcom/android/server/AppOpsService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.UPDATE_APP_OPS_STATS"

    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v2

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/Context;->enforcePermission(Ljava/lang/String;IILjava/lang/String;)V

    goto :goto_0
.end method

.method private verifyIncomingUidForWrite(IILjava/lang/String;)V
    .locals 5
    .param p1, "code"    # I
    .param p2, "uid"    # I
    .param p3, "packageName"    # Ljava/lang/String;

    .prologue
    .line 797
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v0

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v1

    if-ne v0, v1, :cond_1

    .line 805
    :cond_0
    :goto_0
    return-void

    .line 800
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/server/AppOpsService;->checkSystemApp(IILjava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 803
    iget-object v0, p0, Lcom/android/server/AppOpsService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.UPDATE_APP_OPS_STATS"

    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v2

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/Context;->enforcePermission(Ljava/lang/String;IILjava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public checkOperation(IILjava/lang/String;)I
    .locals 8
    .param p1, "code"    # I
    .param p2, "uid"    # I
    .param p3, "packageName"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 575
    invoke-direct {p0, p2}, Lcom/android/server/AppOpsService;->verifyIncomingUidForRead(I)V

    .line 576
    invoke-direct {p0, p1}, Lcom/android/server/AppOpsService;->verifyIncomingOp(I)V

    .line 577
    invoke-direct {p0, p1}, Lcom/android/server/AppOpsService;->isAppPermissionControlOpen(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1, p2, p3}, Lcom/android/server/AppOpsService;->isMiuiAllowed(IILjava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 578
    :cond_0
    const-string v0, "AppOps"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "checkOperation:code "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " uid "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " package "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, p0

    move v1, p2

    move-object v2, p3

    move v3, p1

    move v5, v4

    .line 580
    invoke-direct/range {v0 .. v5}, Lcom/android/server/AppOpsService;->onAppApplyOperation(ILjava/lang/String;IIZ)V

    .line 597
    :goto_0
    return v4

    .line 583
    :cond_1
    monitor-enter p0

    .line 584
    const/4 v4, -0x1

    .line 585
    .local v4, "mode":I
    :try_start_0
    invoke-static {p1}, Landroid/app/AppOpsManager;->opToSwitch(I)I

    move-result v3

    .line 586
    .local v3, "switchCode":I
    const/4 v0, 0x0

    invoke-direct {p0, v3, p2, p3, v0}, Lcom/android/server/AppOpsService;->getOpLocked(IILjava/lang/String;Z)Lcom/android/server/AppOpsService$Op;

    move-result-object v6

    .line 587
    .local v6, "op":Lcom/android/server/AppOpsService$Op;
    if-nez v6, :cond_3

    .line 588
    invoke-direct {p0, p1, p2, p3}, Lcom/android/server/AppOpsService;->getSuggestMode(IILjava/lang/String;)I

    move-result v7

    .line 589
    .local v7, "suggestMode":I
    const/4 v0, -0x1

    if-eq v7, v0, :cond_2

    monitor-exit p0

    move v4, v7

    goto :goto_0

    .line 590
    :cond_2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/server/AppOpsService;->getDefaultMode(IILjava/lang/String;)I

    move-result v4

    .line 594
    .end local v7    # "suggestMode":I
    :goto_1
    const-string v0, "AppOps"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "checkOperation :code "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " uid "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " package "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 596
    const/4 v5, 0x0

    move-object v0, p0

    move v1, p2

    move-object v2, p3

    invoke-direct/range {v0 .. v5}, Lcom/android/server/AppOpsService;->onAppApplyOperation(ILjava/lang/String;IIZ)V

    .line 597
    monitor-exit p0

    goto :goto_0

    .line 598
    .end local v3    # "switchCode":I
    .end local v6    # "op":Lcom/android/server/AppOpsService$Op;
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 592
    .restart local v3    # "switchCode":I
    .restart local v6    # "op":Lcom/android/server/AppOpsService$Op;
    :cond_3
    :try_start_1
    iget v4, v6, Lcom/android/server/AppOpsService$Op;->mode:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1
.end method

.method public checkOperationInternal(IILjava/lang/String;)I
    .locals 3
    .param p1, "code"    # I
    .param p2, "uid"    # I
    .param p3, "packageName"    # Ljava/lang/String;

    .prologue
    .line 497
    invoke-direct {p0, p2}, Lcom/android/server/AppOpsService;->verifyIncomingUidForRead(I)V

    .line 498
    invoke-direct {p0, p1}, Lcom/android/server/AppOpsService;->verifyIncomingOp(I)V

    .line 500
    monitor-enter p0

    .line 501
    :try_start_0
    invoke-static {p1}, Landroid/app/AppOpsManager;->opToSwitch(I)I

    move-result v1

    const/4 v2, 0x0

    invoke-direct {p0, v1, p2, p3, v2}, Lcom/android/server/AppOpsService;->getOpLocked(IILjava/lang/String;Z)Lcom/android/server/AppOpsService$Op;

    move-result-object v0

    .line 502
    .local v0, "op":Lcom/android/server/AppOpsService$Op;
    if-nez v0, :cond_0

    .line 503
    const/4 v1, -0x1

    monitor-exit p0

    .line 505
    :goto_0
    return v1

    :cond_0
    iget v1, v0, Lcom/android/server/AppOpsService$Op;->mode:I

    monitor-exit p0

    goto :goto_0

    .line 506
    .end local v0    # "op":Lcom/android/server/AppOpsService$Op;
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public checkPackage(ILjava/lang/String;)I
    .locals 1
    .param p1, "uid"    # I
    .param p2, "packageName"    # Ljava/lang/String;

    .prologue
    .line 603
    monitor-enter p0

    .line 604
    const/4 v0, 0x1

    :try_start_0
    invoke-direct {p0, p1, p2, v0}, Lcom/android/server/AppOpsService;->getOpsLocked(ILjava/lang/String;Z)Lcom/android/server/AppOpsService$Ops;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 605
    const/4 v0, 0x0

    monitor-exit p0

    .line 607
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x2

    monitor-exit p0

    goto :goto_0

    .line 609
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 16
    .param p1, "fd"    # Ljava/io/FileDescriptor;
    .param p2, "pw"    # Ljava/io/PrintWriter;
    .param p3, "args"    # [Ljava/lang/String;

    .prologue
    .line 1119
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/AppOpsService;->mContext:Landroid/content/Context;

    const-string v13, "android.permission.DUMP"

    invoke-virtual {v12, v13}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v12

    if-eqz v12, :cond_0

    .line 1121
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Permission Denial: can\'t dump ApOps service from from pid="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", uid="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1214
    :goto_0
    return-void

    .line 1127
    :cond_0
    monitor-enter p0

    .line 1128
    :try_start_0
    const-string v12, "Current AppOps Service state:"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1129
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 1130
    .local v7, "now":J
    const/4 v6, 0x0

    .line 1131
    .local v6, "needSep":Z
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/AppOpsService;->mOpModeWatchers:Landroid/util/SparseArray;

    invoke-virtual {v12}, Landroid/util/SparseArray;->size()I

    move-result v12

    if-lez v12, :cond_2

    .line 1132
    const/4 v6, 0x1

    .line 1133
    const-string v12, "  Op mode watchers:"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1134
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/AppOpsService;->mOpModeWatchers:Landroid/util/SparseArray;

    invoke-virtual {v12}, Landroid/util/SparseArray;->size()I

    move-result v12

    if-ge v3, v12, :cond_2

    .line 1135
    const-string v12, "    Op "

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/AppOpsService;->mOpModeWatchers:Landroid/util/SparseArray;

    invoke-virtual {v12, v3}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v12

    invoke-static {v12}, Landroid/app/AppOpsManager;->opToName(I)Ljava/lang/String;

    move-result-object v12

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1136
    const-string v12, ":"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1137
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/AppOpsService;->mOpModeWatchers:Landroid/util/SparseArray;

    invoke-virtual {v12, v3}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    .line 1138
    .local v1, "callbacks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_2
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-ge v5, v12, :cond_1

    .line 1139
    const-string v12, "      #"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Ljava/io/PrintWriter;->print(I)V

    const-string v12, ": "

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1140
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 1138
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 1134
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1144
    .end local v1    # "callbacks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    .end local v3    # "i":I
    .end local v5    # "j":I
    :cond_2
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/AppOpsService;->mPackageModeWatchers:Landroid/util/ArrayMap;

    invoke-virtual {v12}, Landroid/util/ArrayMap;->size()I

    move-result v12

    if-lez v12, :cond_4

    .line 1145
    const/4 v6, 0x1

    .line 1146
    const-string v12, "  Package mode watchers:"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1147
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_3
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/AppOpsService;->mPackageModeWatchers:Landroid/util/ArrayMap;

    invoke-virtual {v12}, Landroid/util/ArrayMap;->size()I

    move-result v12

    if-ge v3, v12, :cond_4

    .line 1148
    const-string v12, "    Pkg "

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/AppOpsService;->mPackageModeWatchers:Landroid/util/ArrayMap;

    invoke-virtual {v12, v3}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1149
    const-string v12, ":"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1150
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/AppOpsService;->mPackageModeWatchers:Landroid/util/ArrayMap;

    invoke-virtual {v12, v3}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    .line 1151
    .restart local v1    # "callbacks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    const/4 v5, 0x0

    .restart local v5    # "j":I
    :goto_4
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-ge v5, v12, :cond_3

    .line 1152
    const-string v12, "      #"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Ljava/io/PrintWriter;->print(I)V

    const-string v12, ": "

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1153
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 1151
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 1147
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 1157
    .end local v1    # "callbacks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    .end local v3    # "i":I
    .end local v5    # "j":I
    :cond_4
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/AppOpsService;->mModeWatchers:Landroid/util/ArrayMap;

    invoke-virtual {v12}, Landroid/util/ArrayMap;->size()I

    move-result v12

    if-lez v12, :cond_5

    .line 1158
    const/4 v6, 0x1

    .line 1159
    const-string v12, "  All mode watchers:"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1160
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_5
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/AppOpsService;->mModeWatchers:Landroid/util/ArrayMap;

    invoke-virtual {v12}, Landroid/util/ArrayMap;->size()I

    move-result v12

    if-ge v3, v12, :cond_5

    .line 1161
    const-string v12, "    "

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/AppOpsService;->mModeWatchers:Landroid/util/ArrayMap;

    invoke-virtual {v12, v3}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v12

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/Object;)V

    .line 1162
    const-string v12, " -> "

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/AppOpsService;->mModeWatchers:Landroid/util/ArrayMap;

    invoke-virtual {v12, v3}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v12

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 1160
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 1165
    .end local v3    # "i":I
    :cond_5
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/AppOpsService;->mClients:Landroid/util/ArrayMap;

    invoke-virtual {v12}, Landroid/util/ArrayMap;->size()I

    move-result v12

    if-lez v12, :cond_7

    .line 1166
    const/4 v6, 0x1

    .line 1167
    const-string v12, "  Clients:"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1168
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_6
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/AppOpsService;->mClients:Landroid/util/ArrayMap;

    invoke-virtual {v12}, Landroid/util/ArrayMap;->size()I

    move-result v12

    if-ge v3, v12, :cond_7

    .line 1169
    const-string v12, "    "

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/AppOpsService;->mClients:Landroid/util/ArrayMap;

    invoke-virtual {v12, v3}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v12

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/Object;)V

    const-string v12, ":"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1170
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/AppOpsService;->mClients:Landroid/util/ArrayMap;

    invoke-virtual {v12, v3}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/AppOpsService$ClientState;

    .line 1171
    .local v2, "cs":Lcom/android/server/AppOpsService$ClientState;
    const-string v12, "      "

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 1172
    iget-object v12, v2, Lcom/android/server/AppOpsService$ClientState;->mStartedOps:Ljava/util/ArrayList;

    if-eqz v12, :cond_6

    iget-object v12, v2, Lcom/android/server/AppOpsService$ClientState;->mStartedOps:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-lez v12, :cond_6

    .line 1173
    const-string v12, "      Started ops:"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1174
    const/4 v5, 0x0

    .restart local v5    # "j":I
    :goto_7
    iget-object v12, v2, Lcom/android/server/AppOpsService$ClientState;->mStartedOps:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-ge v5, v12, :cond_6

    .line 1175
    iget-object v12, v2, Lcom/android/server/AppOpsService$ClientState;->mStartedOps:Ljava/util/ArrayList;

    invoke-virtual {v12, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/server/AppOpsService$Op;

    .line 1176
    .local v9, "op":Lcom/android/server/AppOpsService$Op;
    const-string v12, "        "

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v12, "uid="

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v12, v9, Lcom/android/server/AppOpsService$Op;->uid:I

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(I)V

    .line 1177
    const-string v12, " pkg="

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v12, v9, Lcom/android/server/AppOpsService$Op;->packageName:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1178
    const-string v12, " op="

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v12, v9, Lcom/android/server/AppOpsService$Op;->op:I

    invoke-static {v12}, Landroid/app/AppOpsManager;->opToName(I)Ljava/lang/String;

    move-result-object v12

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1174
    add-int/lit8 v5, v5, 0x1

    goto :goto_7

    .line 1168
    .end local v5    # "j":I
    .end local v9    # "op":Lcom/android/server/AppOpsService$Op;
    :cond_6
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_6

    .line 1183
    .end local v2    # "cs":Lcom/android/server/AppOpsService$ClientState;
    .end local v3    # "i":I
    :cond_7
    if-eqz v6, :cond_8

    .line 1184
    invoke-virtual/range {p2 .. p2}, Ljava/io/PrintWriter;->println()V

    .line 1186
    :cond_8
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_8
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    invoke-virtual {v12}, Landroid/util/SparseArray;->size()I

    move-result v12

    if-ge v3, v12, :cond_e

    .line 1187
    const-string v12, "  Uid "

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    invoke-virtual {v12, v3}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v12

    move-object/from16 v0, p2

    invoke-static {v0, v12}, Landroid/os/UserHandle;->formatUid(Ljava/io/PrintWriter;I)V

    const-string v12, ":"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1188
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    invoke-virtual {v12, v3}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/HashMap;

    .line 1189
    .local v11, "pkgOps":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;"
    invoke-virtual {v11}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_9
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_d

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/android/server/AppOpsService$Ops;

    .line 1190
    .local v10, "ops":Lcom/android/server/AppOpsService$Ops;
    const-string v12, "    Package "

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v12, v10, Lcom/android/server/AppOpsService$Ops;->packageName:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v12, ":"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1191
    const/4 v5, 0x0

    .restart local v5    # "j":I
    :goto_9
    invoke-virtual {v10}, Lcom/android/server/AppOpsService$Ops;->size()I

    move-result v12

    if-ge v5, v12, :cond_9

    .line 1192
    invoke-virtual {v10, v5}, Lcom/android/server/AppOpsService$Ops;->valueAt(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/server/AppOpsService$Op;

    .line 1193
    .restart local v9    # "op":Lcom/android/server/AppOpsService$Op;
    const-string v12, "      "

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v12, v9, Lcom/android/server/AppOpsService$Op;->op:I

    invoke-static {v12}, Landroid/app/AppOpsManager;->opToName(I)Ljava/lang/String;

    move-result-object v12

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1194
    const-string v12, ": mode="

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v12, v9, Lcom/android/server/AppOpsService$Op;->mode:I

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(I)V

    .line 1195
    iget-wide v12, v9, Lcom/android/server/AppOpsService$Op;->time:J

    const-wide/16 v14, 0x0

    cmp-long v12, v12, v14

    if-eqz v12, :cond_a

    .line 1196
    const-string v12, "; time="

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-wide v12, v9, Lcom/android/server/AppOpsService$Op;->time:J

    sub-long v12, v7, v12

    move-object/from16 v0, p2

    invoke-static {v12, v13, v0}, Landroid/util/TimeUtils;->formatDuration(JLjava/io/PrintWriter;)V

    .line 1197
    const-string v12, " ago"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1199
    :cond_a
    iget-wide v12, v9, Lcom/android/server/AppOpsService$Op;->rejectTime:J

    const-wide/16 v14, 0x0

    cmp-long v12, v12, v14

    if-eqz v12, :cond_b

    .line 1200
    const-string v12, "; rejectTime="

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-wide v12, v9, Lcom/android/server/AppOpsService$Op;->rejectTime:J

    sub-long v12, v7, v12

    move-object/from16 v0, p2

    invoke-static {v12, v13, v0}, Landroid/util/TimeUtils;->formatDuration(JLjava/io/PrintWriter;)V

    .line 1201
    const-string v12, " ago"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1203
    :cond_b
    iget v12, v9, Lcom/android/server/AppOpsService$Op;->duration:I

    const/4 v13, -0x1

    if-ne v12, v13, :cond_c

    .line 1204
    const-string v12, " (running)"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1191
    :goto_a
    add-int/lit8 v5, v5, 0x1

    goto :goto_9

    .line 1206
    :cond_c
    const-string v12, "; duration="

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1207
    iget v12, v9, Lcom/android/server/AppOpsService$Op;->duration:I

    int-to-long v12, v12

    move-object/from16 v0, p2

    invoke-static {v12, v13, v0}, Landroid/util/TimeUtils;->formatDuration(JLjava/io/PrintWriter;)V

    .line 1208
    invoke-virtual/range {p2 .. p2}, Ljava/io/PrintWriter;->println()V

    goto :goto_a

    .line 1213
    .end local v3    # "i":I
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v5    # "j":I
    .end local v6    # "needSep":Z
    .end local v7    # "now":J
    .end local v9    # "op":Lcom/android/server/AppOpsService$Op;
    .end local v10    # "ops":Lcom/android/server/AppOpsService$Ops;
    .end local v11    # "pkgOps":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;"
    :catchall_0
    move-exception v12

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v12

    .line 1186
    .restart local v3    # "i":I
    .restart local v4    # "i$":Ljava/util/Iterator;
    .restart local v6    # "needSep":Z
    .restart local v7    # "now":J
    .restart local v11    # "pkgOps":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;"
    :cond_d
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_8

    .line 1213
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v11    # "pkgOps":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;"
    :cond_e
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0
.end method

.method public finishOperation(Landroid/os/IBinder;IILjava/lang/String;)V
    .locals 5
    .param p1, "token"    # Landroid/os/IBinder;
    .param p2, "code"    # I
    .param p3, "uid"    # I
    .param p4, "packageName"    # Ljava/lang/String;

    .prologue
    .line 721
    invoke-direct {p0, p3}, Lcom/android/server/AppOpsService;->verifyIncomingUidForRead(I)V

    .line 722
    invoke-direct {p0, p2}, Lcom/android/server/AppOpsService;->verifyIncomingOp(I)V

    move-object v0, p1

    .line 723
    check-cast v0, Lcom/android/server/AppOpsService$ClientState;

    .line 725
    .local v0, "client":Lcom/android/server/AppOpsService$ClientState;
    monitor-enter p0

    .line 726
    const/4 v2, 0x1

    :try_start_0
    invoke-direct {p0, p2, p3, p4, v2}, Lcom/android/server/AppOpsService;->getOpLocked(IILjava/lang/String;Z)Lcom/android/server/AppOpsService$Op;

    move-result-object v1

    .line 727
    .local v1, "op":Lcom/android/server/AppOpsService$Op;
    if-nez v1, :cond_0

    .line 728
    monitor-exit p0

    .line 738
    :goto_0
    return-void

    .line 730
    :cond_0
    iget-object v2, v0, Lcom/android/server/AppOpsService$ClientState;->mStartedOps:Ljava/util/ArrayList;

    if-eqz v2, :cond_1

    .line 731
    iget-object v2, v0, Lcom/android/server/AppOpsService$ClientState;->mStartedOps:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 732
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Operation not started: uid"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v1, Lcom/android/server/AppOpsService$Op;->uid:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " pkg="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v1, Lcom/android/server/AppOpsService$Op;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " op="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v1, Lcom/android/server/AppOpsService$Op;->op:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 737
    .end local v1    # "op":Lcom/android/server/AppOpsService$Op;
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 736
    .restart local v1    # "op":Lcom/android/server/AppOpsService$Op;
    :cond_1
    :try_start_1
    invoke-virtual {p0, v1}, Lcom/android/server/AppOpsService;->finishOperationLocked(Lcom/android/server/AppOpsService$Op;)V

    .line 737
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method finishOperationLocked(Lcom/android/server/AppOpsService$Op;)V
    .locals 4
    .param p1, "op"    # Lcom/android/server/AppOpsService$Op;

    .prologue
    const/4 v1, 0x1

    .line 741
    iget v0, p1, Lcom/android/server/AppOpsService$Op;->nesting:I

    if-gt v0, v1, :cond_1

    .line 742
    iget v0, p1, Lcom/android/server/AppOpsService$Op;->nesting:I

    if-ne v0, v1, :cond_0

    .line 743
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p1, Lcom/android/server/AppOpsService$Op;->time:J

    sub-long/2addr v0, v2

    long-to-int v0, v0

    iput v0, p1, Lcom/android/server/AppOpsService$Op;->duration:I

    .line 744
    iget-wide v0, p1, Lcom/android/server/AppOpsService$Op;->time:J

    iget v2, p1, Lcom/android/server/AppOpsService$Op;->duration:I

    int-to-long v2, v2

    add-long/2addr v0, v2

    iput-wide v0, p1, Lcom/android/server/AppOpsService$Op;->time:J

    .line 750
    :goto_0
    const/4 v0, 0x0

    iput v0, p1, Lcom/android/server/AppOpsService$Op;->nesting:I

    .line 754
    :goto_1
    return-void

    .line 746
    :cond_0
    const-string v0, "AppOps"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Finishing op nesting under-run: uid "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Lcom/android/server/AppOpsService$Op;->uid:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " pkg "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Lcom/android/server/AppOpsService$Op;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " code "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Lcom/android/server/AppOpsService$Op;->op:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " time="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p1, Lcom/android/server/AppOpsService$Op;->time:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " duration="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Lcom/android/server/AppOpsService$Op;->duration:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " nesting="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Lcom/android/server/AppOpsService$Op;->nesting:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 752
    :cond_1
    iget v0, p1, Lcom/android/server/AppOpsService$Op;->nesting:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p1, Lcom/android/server/AppOpsService$Op;->nesting:I

    goto :goto_1
.end method

.method public getOpsForPackage(ILjava/lang/String;[I)Ljava/util/List;
    .locals 8
    .param p1, "uid"    # I
    .param p2, "packageName"    # Ljava/lang/String;
    .param p3, "ops"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "[I)",
            "Ljava/util/List",
            "<",
            "Landroid/app/AppOpsManager$PackageOps;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 329
    iget-object v4, p0, Lcom/android/server/AppOpsService;->mContext:Landroid/content/Context;

    const-string v5, "android.permission.GET_APP_OPS_STATS"

    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v6

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v7

    invoke-virtual {v4, v5, v6, v7, v1}, Landroid/content/Context;->enforcePermission(Ljava/lang/String;IILjava/lang/String;)V

    .line 331
    monitor-enter p0

    .line 332
    const/4 v4, 0x0

    :try_start_0
    invoke-direct {p0, p1, p2, v4}, Lcom/android/server/AppOpsService;->getOpsLocked(ILjava/lang/String;Z)Lcom/android/server/AppOpsService$Ops;

    move-result-object v0

    .line 333
    .local v0, "pkgOps":Lcom/android/server/AppOpsService$Ops;
    if-nez v0, :cond_0

    .line 334
    monitor-exit p0

    .line 344
    :goto_0
    return-object v1

    .line 336
    :cond_0
    invoke-direct {p0, v0, p3}, Lcom/android/server/AppOpsService;->collectOps(Lcom/android/server/AppOpsService$Ops;[I)Ljava/util/ArrayList;

    move-result-object v2

    .line 337
    .local v2, "resOps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$OpEntry;>;"
    if-nez v2, :cond_1

    .line 338
    monitor-exit p0

    goto :goto_0

    .line 345
    .end local v0    # "pkgOps":Lcom/android/server/AppOpsService$Ops;
    .end local v2    # "resOps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$OpEntry;>;"
    :catchall_0
    move-exception v4

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .line 340
    .restart local v0    # "pkgOps":Lcom/android/server/AppOpsService$Ops;
    .restart local v2    # "resOps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$OpEntry;>;"
    :cond_1
    :try_start_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 341
    .local v1, "res":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$PackageOps;>;"
    new-instance v3, Landroid/app/AppOpsManager$PackageOps;

    iget-object v4, v0, Lcom/android/server/AppOpsService$Ops;->packageName:Ljava/lang/String;

    iget v5, v0, Lcom/android/server/AppOpsService$Ops;->uid:I

    invoke-direct {v3, v4, v5, v2}, Landroid/app/AppOpsManager$PackageOps;-><init>(Ljava/lang/String;ILjava/util/List;)V

    .line 343
    .local v3, "resPackage":Landroid/app/AppOpsManager$PackageOps;
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 344
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public getPackagesForOps([I)Ljava/util/List;
    .locals 13
    .param p1, "ops"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I)",
            "Ljava/util/List",
            "<",
            "Landroid/app/AppOpsManager$PackageOps;",
            ">;"
        }
    .end annotation

    .prologue
    .line 304
    iget-object v8, p0, Lcom/android/server/AppOpsService;->mContext:Landroid/content/Context;

    const-string v9, "android.permission.GET_APP_OPS_STATS"

    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v10

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v11

    const/4 v12, 0x0

    invoke-virtual {v8, v9, v10, v11, v12}, Landroid/content/Context;->enforcePermission(Ljava/lang/String;IILjava/lang/String;)V

    .line 306
    const/4 v4, 0x0

    .line 307
    .local v4, "res":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$PackageOps;>;"
    monitor-enter p0

    .line 308
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    :try_start_0
    iget-object v8, p0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    invoke-virtual {v8}, Landroid/util/SparseArray;->size()I

    move-result v8

    if-ge v0, v8, :cond_1

    .line 309
    iget-object v8, p0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    invoke-virtual {v8, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    .line 310
    .local v2, "packages":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;"
    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    move-object v5, v4

    .end local v4    # "res":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$PackageOps;>;"
    .local v5, "res":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$PackageOps;>;"
    :goto_1
    :try_start_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/AppOpsService$Ops;

    .line 311
    .local v3, "pkgOps":Lcom/android/server/AppOpsService$Ops;
    invoke-direct {p0, v3, p1}, Lcom/android/server/AppOpsService;->collectOps(Lcom/android/server/AppOpsService$Ops;[I)Ljava/util/ArrayList;

    move-result-object v6

    .line 312
    .local v6, "resOps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$OpEntry;>;"
    if-eqz v6, :cond_3

    .line 313
    if-nez v5, :cond_2

    .line 314
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 316
    .end local v5    # "res":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$PackageOps;>;"
    .restart local v4    # "res":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$PackageOps;>;"
    :goto_2
    :try_start_2
    new-instance v7, Landroid/app/AppOpsManager$PackageOps;

    iget-object v8, v3, Lcom/android/server/AppOpsService$Ops;->packageName:Ljava/lang/String;

    iget v9, v3, Lcom/android/server/AppOpsService$Ops;->uid:I

    invoke-direct {v7, v8, v9, v6}, Landroid/app/AppOpsManager$PackageOps;-><init>(Ljava/lang/String;ILjava/util/List;)V

    .line 318
    .local v7, "resPackage":Landroid/app/AppOpsManager$PackageOps;
    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .end local v7    # "resPackage":Landroid/app/AppOpsManager$PackageOps;
    :goto_3
    move-object v5, v4

    .line 320
    .end local v4    # "res":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$PackageOps;>;"
    .restart local v5    # "res":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$PackageOps;>;"
    goto :goto_1

    .line 308
    .end local v3    # "pkgOps":Lcom/android/server/AppOpsService$Ops;
    .end local v6    # "resOps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$OpEntry;>;"
    :cond_0
    add-int/lit8 v0, v0, 0x1

    move-object v4, v5

    .end local v5    # "res":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$PackageOps;>;"
    .restart local v4    # "res":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$PackageOps;>;"
    goto :goto_0

    .line 322
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "packages":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;"
    :cond_1
    monitor-exit p0

    .line 323
    return-object v4

    .line 322
    :catchall_0
    move-exception v8

    :goto_4
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v8

    .end local v4    # "res":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$PackageOps;>;"
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v2    # "packages":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;"
    .restart local v5    # "res":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$PackageOps;>;"
    :catchall_1
    move-exception v8

    move-object v4, v5

    .end local v5    # "res":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$PackageOps;>;"
    .restart local v4    # "res":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$PackageOps;>;"
    goto :goto_4

    .end local v4    # "res":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$PackageOps;>;"
    .restart local v3    # "pkgOps":Lcom/android/server/AppOpsService$Ops;
    .restart local v5    # "res":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$PackageOps;>;"
    .restart local v6    # "resOps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$OpEntry;>;"
    :cond_2
    move-object v4, v5

    .end local v5    # "res":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$PackageOps;>;"
    .restart local v4    # "res":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$PackageOps;>;"
    goto :goto_2

    .end local v4    # "res":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$PackageOps;>;"
    .restart local v5    # "res":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$PackageOps;>;"
    :cond_3
    move-object v4, v5

    .end local v5    # "res":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$PackageOps;>;"
    .restart local v4    # "res":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/AppOpsManager$PackageOps;>;"
    goto :goto_3
.end method

.method public getToken(Landroid/os/IBinder;)Landroid/os/IBinder;
    .locals 2
    .param p1, "clientToken"    # Landroid/os/IBinder;

    .prologue
    .line 563
    monitor-enter p0

    .line 564
    :try_start_0
    iget-object v1, p0, Lcom/android/server/AppOpsService;->mClients:Landroid/util/ArrayMap;

    invoke-virtual {v1, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/AppOpsService$ClientState;

    .line 565
    .local v0, "cs":Lcom/android/server/AppOpsService$ClientState;
    if-nez v0, :cond_0

    .line 566
    new-instance v0, Lcom/android/server/AppOpsService$ClientState;

    .end local v0    # "cs":Lcom/android/server/AppOpsService$ClientState;
    invoke-direct {v0, p0, p1}, Lcom/android/server/AppOpsService$ClientState;-><init>(Lcom/android/server/AppOpsService;Landroid/os/IBinder;)V

    .line 567
    .restart local v0    # "cs":Lcom/android/server/AppOpsService$ClientState;
    iget-object v1, p0, Lcom/android/server/AppOpsService;->mClients:Landroid/util/ArrayMap;

    invoke-virtual {v1, p1, v0}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 569
    :cond_0
    monitor-exit p0

    return-object v0

    .line 570
    .end local v0    # "cs":Lcom/android/server/AppOpsService$ClientState;
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public noteOperation(IILjava/lang/String;)I
    .locals 11
    .param p1, "code"    # I
    .param p2, "uid"    # I
    .param p3, "packageName"    # Ljava/lang/String;

    .prologue
    .line 614
    invoke-direct {p0, p2}, Lcom/android/server/AppOpsService;->verifyIncomingUidForRead(I)V

    .line 615
    invoke-direct {p0, p1}, Lcom/android/server/AppOpsService;->verifyIncomingOp(I)V

    .line 617
    const/4 v7, 0x0

    .line 618
    .local v7, "ops":Lcom/android/server/AppOpsService$Ops;
    const/4 v6, 0x0

    .local v6, "op":Lcom/android/server/AppOpsService$Op;
    const/4 v8, 0x0

    .line 620
    .local v8, "switchOp":Lcom/android/server/AppOpsService$Op;
    monitor-enter p0

    .line 621
    const/4 v0, 0x1

    :try_start_0
    invoke-direct {p0, p2, p3, v0}, Lcom/android/server/AppOpsService;->getOpsLocked(ILjava/lang/String;Z)Lcom/android/server/AppOpsService$Ops;

    move-result-object v7

    .line 622
    if-nez v7, :cond_0

    .line 625
    const/4 v4, 0x2

    const/4 v5, 0x0

    move-object v0, p0

    move v1, p2

    move-object v2, p3

    move v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/server/AppOpsService;->onAppApplyOperation(ILjava/lang/String;IIZ)V

    .line 626
    const/4 v4, 0x2

    monitor-exit p0

    .line 664
    :goto_0
    return v4

    .line 628
    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v7, p1, v0}, Lcom/android/server/AppOpsService;->getOpLocked(Lcom/android/server/AppOpsService$Ops;IZ)Lcom/android/server/AppOpsService$Op;

    move-result-object v6

    .line 629
    iget v0, v6, Lcom/android/server/AppOpsService$Op;->duration:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 630
    const-string v0, "AppOps"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Noting op not finished: uid "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " pkg "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " code "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " time="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v9, v6, Lcom/android/server/AppOpsService$Op;->time:J

    invoke-virtual {v1, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " duration="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v6, Lcom/android/server/AppOpsService$Op;->duration:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 633
    :cond_1
    const/4 v0, 0x0

    iput v0, v6, Lcom/android/server/AppOpsService$Op;->duration:I

    .line 634
    invoke-static {p1}, Landroid/app/AppOpsManager;->opToSwitch(I)I

    move-result v3

    .line 635
    .local v3, "switchCode":I
    if-eq v3, p1, :cond_6

    const/4 v0, 0x1

    invoke-direct {p0, v7, v3, v0}, Lcom/android/server/AppOpsService;->getOpLocked(Lcom/android/server/AppOpsService$Ops;IZ)Lcom/android/server/AppOpsService$Op;

    move-result-object v8

    .line 636
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 637
    iget v4, v8, Lcom/android/server/AppOpsService$Op;->mode:I

    .line 640
    .local v4, "resultMode":I
    invoke-direct {p0, p1}, Lcom/android/server/AppOpsService;->isAppPermissionControlOpen(I)Z

    move-result v0

    if-nez v0, :cond_7

    .line 641
    const/4 v4, 0x0

    .line 648
    :cond_2
    :goto_2
    const/4 v0, 0x3

    if-ne v4, v0, :cond_3

    .line 651
    invoke-direct {p0, v3, p2, p3}, Lcom/android/server/AppOpsService;->askOperationLocked(IILjava/lang/String;)I

    move-result v4

    .line 653
    :cond_3
    const/4 v0, 0x1

    if-eq v4, v0, :cond_4

    const/4 v0, 0x2

    if-ne v4, v0, :cond_8

    .line 656
    :cond_4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, v6, Lcom/android/server/AppOpsService$Op;->rejectTime:J

    .line 663
    :cond_5
    :goto_3
    const/4 v5, 0x0

    move-object v0, p0

    move v1, p2

    move-object v2, p3

    invoke-direct/range {v0 .. v5}, Lcom/android/server/AppOpsService;->onAppApplyOperation(ILjava/lang/String;IIZ)V

    goto/16 :goto_0

    .end local v4    # "resultMode":I
    :cond_6
    move-object v8, v6

    .line 635
    goto :goto_1

    .line 636
    .end local v3    # "switchCode":I
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 644
    .restart local v3    # "switchCode":I
    .restart local v4    # "resultMode":I
    :cond_7
    invoke-direct {p0, p1, p2, p3}, Lcom/android/server/AppOpsService;->isMiuiAllowed(IILjava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 645
    const/4 v0, 0x0

    iput v0, v8, Lcom/android/server/AppOpsService$Op;->mode:I

    .line 646
    const/4 v4, 0x0

    goto :goto_2

    .line 657
    :cond_8
    if-nez v4, :cond_5

    .line 660
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, v6, Lcom/android/server/AppOpsService$Op;->time:J

    .line 661
    const-wide/16 v0, 0x0

    iput-wide v0, v6, Lcom/android/server/AppOpsService$Op;->rejectTime:J

    goto :goto_3
.end method

.method public packageRemoved(ILjava/lang/String;)V
    .locals 2
    .param p1, "uid"    # I
    .param p2, "packageName"    # Ljava/lang/String;

    .prologue
    .line 242
    monitor-enter p0

    .line 243
    :try_start_0
    iget-object v1, p0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 244
    .local v0, "pkgs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;"
    if-eqz v0, :cond_1

    .line 245
    invoke-virtual {v0, p2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 246
    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v1

    if-gtz v1, :cond_0

    .line 247
    iget-object v1, p0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 249
    :cond_0
    invoke-direct {p0}, Lcom/android/server/AppOpsService;->scheduleWriteLocked()V

    .line 252
    :cond_1
    monitor-exit p0

    .line 253
    return-void

    .line 252
    .end local v0    # "pkgs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;"
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public publish(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 205
    iput-object p1, p0, Lcom/android/server/AppOpsService;->mContext:Landroid/content/Context;

    .line 206
    const-string v0, "appops"

    invoke-virtual {p0}, Lcom/android/server/AppOpsService;->asBinder()Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 207
    return-void
.end method

.method readPackage(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 8
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;,
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x3

    .line 974
    const/4 v4, 0x0

    const-string v5, "n"

    invoke-interface {p1, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 975
    .local v1, "pkgName":Ljava/lang/String;
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v0

    .line 978
    .local v0, "outerDepth":I
    :cond_0
    :goto_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v3

    .local v3, "type":I
    const/4 v4, 0x1

    if-eq v3, v4, :cond_3

    if-ne v3, v7, :cond_1

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v4

    if-le v4, v0, :cond_3

    .line 979
    :cond_1
    if-eq v3, v7, :cond_0

    const/4 v4, 0x4

    if-eq v3, v4, :cond_0

    .line 983
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    .line 984
    .local v2, "tagName":Ljava/lang/String;
    const-string v4, "uid"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 985
    invoke-virtual {p0, p1, v1}, Lcom/android/server/AppOpsService;->readUid(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)V

    goto :goto_0

    .line 987
    :cond_2
    const-string v4, "AppOps"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unknown element under <pkg>: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 989
    invoke-static {p1}, Lcom/android/internal/util/XmlUtils;->skipCurrentTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_0

    .line 992
    .end local v2    # "tagName":Ljava/lang/String;
    :cond_3
    return-void
.end method

.method readState()V
    .locals 13

    .prologue
    const/4 v12, 0x3

    const/4 v9, 0x2

    const/4 v11, 0x1

    .line 907
    iget-object v8, p0, Lcom/android/server/AppOpsService;->mFile:Landroid/util/AtomicFile;

    monitor-enter v8

    .line 908
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 911
    :try_start_1
    iget-object v7, p0, Lcom/android/server/AppOpsService;->mFile:Landroid/util/AtomicFile;

    invoke-virtual {v7}, Landroid/util/AtomicFile;->openRead()Ljava/io/FileInputStream;
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    move-result-object v3

    .line 916
    .local v3, "stream":Ljava/io/FileInputStream;
    const/4 v4, 0x0

    .line 918
    .local v4, "success":Z
    :try_start_2
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v2

    .line 919
    .local v2, "parser":Lorg/xmlpull/v1/XmlPullParser;
    const/4 v7, 0x0

    invoke-interface {v2, v3, v7}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 922
    :cond_0
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v6

    .local v6, "type":I
    if-eq v6, v9, :cond_1

    if-ne v6, v11, :cond_0

    .line 926
    :cond_1
    if-eq v6, v9, :cond_3

    .line 927
    new-instance v7, Ljava/lang/IllegalStateException;

    const-string v9, "no start tag found"

    invoke-direct {v7, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_2
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_2} :catch_7
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_9
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_2 .. :try_end_2} :catch_b
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 947
    .end local v2    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v6    # "type":I
    :catch_0
    move-exception v0

    .line 948
    .local v0, "e":Ljava/lang/IllegalStateException;
    :try_start_3
    const-string v7, "AppOps"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Failed parsing "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 960
    if-nez v4, :cond_2

    .line 961
    :try_start_4
    iget-object v7, p0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    invoke-virtual {v7}, Landroid/util/SparseArray;->clear()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 964
    :cond_2
    :try_start_5
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_d
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 968
    .end local v0    # "e":Ljava/lang/IllegalStateException;
    :goto_0
    :try_start_6
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 969
    :try_start_7
    monitor-exit v8
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 970
    .end local v3    # "stream":Ljava/io/FileInputStream;
    .end local v4    # "success":Z
    :goto_1
    return-void

    .line 912
    :catch_1
    move-exception v0

    .line 913
    .local v0, "e":Ljava/io/FileNotFoundException;
    :try_start_8
    const-string v7, "AppOps"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "No existing app ops "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/android/server/AppOpsService;->mFile:Landroid/util/AtomicFile;

    invoke-virtual {v10}, Landroid/util/AtomicFile;->getBaseFile()Ljava/io/File;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "; starting empty"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 914
    monitor-exit p0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    :try_start_9
    monitor-exit v8

    goto :goto_1

    .line 969
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    :catchall_0
    move-exception v7

    monitor-exit v8
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    throw v7

    .line 930
    .restart local v2    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v3    # "stream":Ljava/io/FileInputStream;
    .restart local v4    # "success":Z
    .restart local v6    # "type":I
    :cond_3
    :try_start_a
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v1

    .line 932
    .local v1, "outerDepth":I
    :cond_4
    :goto_2
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v6

    if-eq v6, v11, :cond_9

    if-ne v6, v12, :cond_5

    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v7

    if-le v7, v1, :cond_9

    .line 933
    :cond_5
    if-eq v6, v12, :cond_4

    const/4 v7, 0x4

    if-eq v6, v7, :cond_4

    .line 937
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    .line 938
    .local v5, "tagName":Ljava/lang/String;
    const-string v7, "pkg"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 939
    invoke-virtual {p0, v2}, Lcom/android/server/AppOpsService;->readPackage(Lorg/xmlpull/v1/XmlPullParser;)V
    :try_end_a
    .catch Ljava/lang/IllegalStateException; {:try_start_a .. :try_end_a} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_a .. :try_end_a} :catch_2
    .catch Ljava/lang/NumberFormatException; {:try_start_a .. :try_end_a} :catch_4
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_a .. :try_end_a} :catch_7
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_9
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_a .. :try_end_a} :catch_b
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    goto :goto_2

    .line 949
    .end local v1    # "outerDepth":I
    .end local v2    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v5    # "tagName":Ljava/lang/String;
    .end local v6    # "type":I
    :catch_2
    move-exception v0

    .line 950
    .local v0, "e":Ljava/lang/NullPointerException;
    :try_start_b
    const-string v7, "AppOps"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Failed parsing "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 960
    if-nez v4, :cond_6

    .line 961
    :try_start_c
    iget-object v7, p0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    invoke-virtual {v7}, Landroid/util/SparseArray;->clear()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 964
    :cond_6
    :try_start_d
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_3
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    goto :goto_0

    .line 965
    :catch_3
    move-exception v7

    goto :goto_0

    .line 941
    .end local v0    # "e":Ljava/lang/NullPointerException;
    .restart local v1    # "outerDepth":I
    .restart local v2    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v5    # "tagName":Ljava/lang/String;
    .restart local v6    # "type":I
    :cond_7
    :try_start_e
    const-string v7, "AppOps"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Unknown element under <app-ops>: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 943
    invoke-static {v2}, Lcom/android/internal/util/XmlUtils;->skipCurrentTag(Lorg/xmlpull/v1/XmlPullParser;)V
    :try_end_e
    .catch Ljava/lang/IllegalStateException; {:try_start_e .. :try_end_e} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_e .. :try_end_e} :catch_2
    .catch Ljava/lang/NumberFormatException; {:try_start_e .. :try_end_e} :catch_4
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_e .. :try_end_e} :catch_7
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_9
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_e .. :try_end_e} :catch_b
    .catchall {:try_start_e .. :try_end_e} :catchall_1

    goto :goto_2

    .line 951
    .end local v1    # "outerDepth":I
    .end local v2    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v5    # "tagName":Ljava/lang/String;
    .end local v6    # "type":I
    :catch_4
    move-exception v0

    .line 952
    .local v0, "e":Ljava/lang/NumberFormatException;
    :try_start_f
    const-string v7, "AppOps"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Failed parsing "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_1

    .line 960
    if-nez v4, :cond_8

    .line 961
    :try_start_10
    iget-object v7, p0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    invoke-virtual {v7}, Landroid/util/SparseArray;->clear()V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_2

    .line 964
    :cond_8
    :try_start_11
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_11} :catch_5
    .catchall {:try_start_11 .. :try_end_11} :catchall_2

    goto/16 :goto_0

    .line 965
    :catch_5
    move-exception v7

    goto/16 :goto_0

    .line 946
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .restart local v1    # "outerDepth":I
    .restart local v2    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v6    # "type":I
    :cond_9
    const/4 v4, 0x1

    .line 960
    if-nez v4, :cond_a

    .line 961
    :try_start_12
    iget-object v7, p0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    invoke-virtual {v7}, Landroid/util/SparseArray;->clear()V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_2

    .line 964
    :cond_a
    :try_start_13
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_13} :catch_6
    .catchall {:try_start_13 .. :try_end_13} :catchall_2

    goto/16 :goto_0

    .line 965
    :catch_6
    move-exception v7

    goto/16 :goto_0

    .line 953
    .end local v1    # "outerDepth":I
    .end local v2    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v6    # "type":I
    :catch_7
    move-exception v0

    .line 954
    .local v0, "e":Lorg/xmlpull/v1/XmlPullParserException;
    :try_start_14
    const-string v7, "AppOps"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Failed parsing "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_1

    .line 960
    if-nez v4, :cond_b

    .line 961
    :try_start_15
    iget-object v7, p0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    invoke-virtual {v7}, Landroid/util/SparseArray;->clear()V
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_2

    .line 964
    :cond_b
    :try_start_16
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_16} :catch_8
    .catchall {:try_start_16 .. :try_end_16} :catchall_2

    goto/16 :goto_0

    .line 965
    :catch_8
    move-exception v7

    goto/16 :goto_0

    .line 955
    .end local v0    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    :catch_9
    move-exception v0

    .line 956
    .local v0, "e":Ljava/io/IOException;
    :try_start_17
    const-string v7, "AppOps"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Failed parsing "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_1

    .line 960
    if-nez v4, :cond_c

    .line 961
    :try_start_18
    iget-object v7, p0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    invoke-virtual {v7}, Landroid/util/SparseArray;->clear()V
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_2

    .line 964
    :cond_c
    :try_start_19
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_19} :catch_a
    .catchall {:try_start_19 .. :try_end_19} :catchall_2

    goto/16 :goto_0

    .line 965
    :catch_a
    move-exception v7

    goto/16 :goto_0

    .line 957
    .end local v0    # "e":Ljava/io/IOException;
    :catch_b
    move-exception v0

    .line 958
    .local v0, "e":Ljava/lang/IndexOutOfBoundsException;
    :try_start_1a
    const-string v7, "AppOps"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Failed parsing "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_1

    .line 960
    if-nez v4, :cond_d

    .line 961
    :try_start_1b
    iget-object v7, p0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    invoke-virtual {v7}, Landroid/util/SparseArray;->clear()V
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_2

    .line 964
    :cond_d
    :try_start_1c
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_1c} :catch_c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_2

    goto/16 :goto_0

    .line 965
    :catch_c
    move-exception v7

    goto/16 :goto_0

    .line 960
    .end local v0    # "e":Ljava/lang/IndexOutOfBoundsException;
    :catchall_1
    move-exception v7

    if-nez v4, :cond_e

    .line 961
    :try_start_1d
    iget-object v9, p0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    invoke-virtual {v9}, Landroid/util/SparseArray;->clear()V
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_2

    .line 964
    :cond_e
    :try_start_1e
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_1e
    .catch Ljava/io/IOException; {:try_start_1e .. :try_end_1e} :catch_e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_2

    .line 966
    :goto_3
    :try_start_1f
    throw v7

    .line 968
    .end local v3    # "stream":Ljava/io/FileInputStream;
    .end local v4    # "success":Z
    :catchall_2
    move-exception v7

    monitor-exit p0
    :try_end_1f
    .catchall {:try_start_1f .. :try_end_1f} :catchall_2

    :try_start_20
    throw v7
    :try_end_20
    .catchall {:try_start_20 .. :try_end_20} :catchall_0

    .line 965
    .local v0, "e":Ljava/lang/IllegalStateException;
    .restart local v3    # "stream":Ljava/io/FileInputStream;
    .restart local v4    # "success":Z
    :catch_d
    move-exception v7

    goto/16 :goto_0

    .end local v0    # "e":Ljava/lang/IllegalStateException;
    :catch_e
    move-exception v9

    goto :goto_3
.end method

.method readUid(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)V
    .locals 17
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "pkgName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;,
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 996
    const/4 v14, 0x0

    const-string v15, "n"

    move-object/from16 v0, p1

    invoke-interface {v0, v14, v15}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v13

    .line 997
    .local v13, "uid":I
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v8

    .line 1000
    .local v8, "outerDepth":I
    :cond_0
    :goto_0
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v12

    .local v12, "type":I
    const/4 v14, 0x1

    if-eq v12, v14, :cond_9

    const/4 v14, 0x3

    if-ne v12, v14, :cond_1

    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v14

    if-le v14, v8, :cond_9

    .line 1001
    :cond_1
    const/4 v14, 0x3

    if-eq v12, v14, :cond_0

    const/4 v14, 0x4

    if-eq v12, v14, :cond_0

    .line 1005
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v10

    .line 1006
    .local v10, "tagName":Ljava/lang/String;
    const-string v14, "op"

    invoke-virtual {v10, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_8

    .line 1007
    const/4 v14, 0x0

    const-string v15, "n"

    move-object/from16 v0, p1

    invoke-interface {v0, v14, v15}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 1008
    .local v2, "code":I
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v2, v13, v1}, Lcom/android/server/AppOpsService;->getDefaultMode(IILjava/lang/String;)I

    move-result v3

    .line 1009
    .local v3, "defaultMode":I
    new-instance v6, Lcom/android/server/AppOpsService$Op;

    move-object/from16 v0, p2

    invoke-direct {v6, v13, v0, v2, v3}, Lcom/android/server/AppOpsService$Op;-><init>(ILjava/lang/String;II)V

    .line 1010
    .local v6, "op":Lcom/android/server/AppOpsService$Op;
    const/4 v14, 0x0

    const-string v15, "m"

    move-object/from16 v0, p1

    invoke-interface {v0, v14, v15}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1011
    .local v5, "mode":Ljava/lang/String;
    if-eqz v5, :cond_2

    .line 1012
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    iput v14, v6, Lcom/android/server/AppOpsService$Op;->mode:I

    .line 1014
    :cond_2
    const/4 v14, 0x0

    const-string v15, "t"

    move-object/from16 v0, p1

    invoke-interface {v0, v14, v15}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 1015
    .local v11, "time":Ljava/lang/String;
    if-eqz v11, :cond_3

    .line 1016
    invoke-static {v11}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v14

    iput-wide v14, v6, Lcom/android/server/AppOpsService$Op;->time:J

    .line 1018
    :cond_3
    const/4 v14, 0x0

    const-string v15, "r"

    move-object/from16 v0, p1

    invoke-interface {v0, v14, v15}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 1019
    if-eqz v11, :cond_4

    .line 1020
    invoke-static {v11}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v14

    iput-wide v14, v6, Lcom/android/server/AppOpsService$Op;->rejectTime:J

    .line 1022
    :cond_4
    const/4 v14, 0x0

    const-string v15, "d"

    move-object/from16 v0, p1

    invoke-interface {v0, v14, v15}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1023
    .local v4, "dur":Ljava/lang/String;
    if-eqz v4, :cond_5

    .line 1024
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    iput v14, v6, Lcom/android/server/AppOpsService$Op;->duration:I

    .line 1026
    :cond_5
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    invoke-virtual {v14, v13}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/HashMap;

    .line 1027
    .local v9, "pkgOps":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;"
    if-nez v9, :cond_6

    .line 1028
    new-instance v9, Ljava/util/HashMap;

    .end local v9    # "pkgOps":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;"
    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 1029
    .restart local v9    # "pkgOps":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;"
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    invoke-virtual {v14, v13, v9}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 1031
    :cond_6
    move-object/from16 v0, p2

    invoke-virtual {v9, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/server/AppOpsService$Ops;

    .line 1032
    .local v7, "ops":Lcom/android/server/AppOpsService$Ops;
    if-nez v7, :cond_7

    .line 1033
    new-instance v7, Lcom/android/server/AppOpsService$Ops;

    .end local v7    # "ops":Lcom/android/server/AppOpsService$Ops;
    move-object/from16 v0, p2

    invoke-direct {v7, v0, v13}, Lcom/android/server/AppOpsService$Ops;-><init>(Ljava/lang/String;I)V

    .line 1034
    .restart local v7    # "ops":Lcom/android/server/AppOpsService$Ops;
    move-object/from16 v0, p2

    invoke-virtual {v9, v0, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1036
    :cond_7
    iget v14, v6, Lcom/android/server/AppOpsService$Op;->op:I

    invoke-virtual {v7, v14, v6}, Lcom/android/server/AppOpsService$Ops;->put(ILjava/lang/Object;)V

    goto/16 :goto_0

    .line 1038
    .end local v2    # "code":I
    .end local v3    # "defaultMode":I
    .end local v4    # "dur":Ljava/lang/String;
    .end local v5    # "mode":Ljava/lang/String;
    .end local v6    # "op":Lcom/android/server/AppOpsService$Op;
    .end local v7    # "ops":Lcom/android/server/AppOpsService$Ops;
    .end local v9    # "pkgOps":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;"
    .end local v11    # "time":Ljava/lang/String;
    :cond_8
    const-string v14, "AppOps"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Unknown element under <pkg>: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1040
    invoke-static/range {p1 .. p1}, Lcom/android/internal/util/XmlUtils;->skipCurrentTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_0

    .line 1043
    .end local v10    # "tagName":Ljava/lang/String;
    :cond_9
    return-void
.end method

.method public registerCallback(Lcom/android/internal/app/IOpsCallback;)I
    .locals 5
    .param p1, "callback"    # Lcom/android/internal/app/IOpsCallback;

    .prologue
    .line 485
    iget-object v0, p0, Lcom/android/server/AppOpsService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.UPDATE_APP_OPS_STATS"

    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v2

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/Context;->enforcePermission(Ljava/lang/String;IILjava/lang/String;)V

    .line 487
    if-eqz p1, :cond_0

    .line 488
    .line 489
    const/4 v0, 0x0

    .line 491
    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public resetAllModes()V
    .locals 26

    .prologue
    .line 428
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AppOpsService;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    const-string v22, "android.permission.UPDATE_APP_OPS_STATS"

    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v23

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v24

    const/16 v25, 0x0

    invoke-virtual/range {v21 .. v25}, Landroid/content/Context;->enforcePermission(Ljava/lang/String;IILjava/lang/String;)V

    .line 430
    const/4 v4, 0x0

    .line 431
    .local v4, "callbacks":Ljava/util/HashMap;, "Ljava/util/HashMap<Lcom/android/server/AppOpsService$Callback;Ljava/util/ArrayList<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Integer;>;>;>;"
    monitor-enter p0

    .line 432
    const/4 v6, 0x0

    .line 433
    .local v6, "changed":Z
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/util/SparseArray;->size()I

    move-result v21

    add-int/lit8 v11, v21, -0x1

    .local v11, "i":I
    :goto_0
    if-ltz v11, :cond_6

    .line 434
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v11}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/util/HashMap;

    .line 435
    .local v16, "packages":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;"
    invoke-virtual/range {v16 .. v16}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .line 436
    .local v13, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;>;"
    :cond_0
    :goto_1
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_4

    .line 437
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/Map$Entry;

    .line 438
    .local v10, "ent":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;"
    invoke-interface {v10}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    .line 439
    .local v15, "packageName":Ljava/lang/String;
    invoke-interface {v10}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/android/server/AppOpsService$Ops;

    .line 440
    .local v17, "pkgOps":Lcom/android/server/AppOpsService$Ops;
    invoke-virtual/range {v17 .. v17}, Lcom/android/server/AppOpsService$Ops;->size()I

    move-result v21

    add-int/lit8 v14, v21, -0x1

    .local v14, "j":I
    :goto_2
    if-ltz v14, :cond_3

    .line 441
    move-object/from16 v0, v17

    invoke-virtual {v0, v14}, Lcom/android/server/AppOpsService$Ops;->valueAt(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/server/AppOpsService$Op;

    .line 442
    .local v7, "curOp":Lcom/android/server/AppOpsService$Op;
    iget v0, v7, Lcom/android/server/AppOpsService$Op;->op:I

    move/from16 v21, v0

    iget v0, v7, Lcom/android/server/AppOpsService$Op;->uid:I

    move/from16 v22, v0

    iget-object v0, v7, Lcom/android/server/AppOpsService$Op;->packageName:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    move/from16 v1, v21

    move/from16 v2, v22

    move-object/from16 v3, v23

    invoke-direct {v0, v1, v2, v3}, Lcom/android/server/AppOpsService;->getDefaultMode(IILjava/lang/String;)I

    move-result v8

    .line 443
    .local v8, "defaultMode":I
    iget v0, v7, Lcom/android/server/AppOpsService$Op;->op:I

    move/from16 v21, v0

    invoke-static/range {v21 .. v21}, Landroid/app/AppOpsManager;->opAllowsReset(I)Z

    move-result v21

    if-eqz v21, :cond_1

    iget v0, v7, Lcom/android/server/AppOpsService$Op;->mode:I

    move/from16 v21, v0

    move/from16 v0, v21

    if-eq v0, v8, :cond_1

    .line 444
    iget v0, v7, Lcom/android/server/AppOpsService$Op;->op:I

    move/from16 v21, v0

    iget v0, v7, Lcom/android/server/AppOpsService$Op;->uid:I

    move/from16 v22, v0

    iget-object v0, v7, Lcom/android/server/AppOpsService$Op;->packageName:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    move/from16 v1, v21

    move/from16 v2, v22

    move-object/from16 v3, v23

    invoke-direct {v0, v1, v2, v3}, Lcom/android/server/AppOpsService;->getSuggestMode(IILjava/lang/String;)I

    move-result v20

    .line 445
    .local v20, "suggestMode":I
    const/16 v21, -0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-eq v0, v1, :cond_2

    .end local v20    # "suggestMode":I
    :goto_3
    move/from16 v0, v20

    iput v0, v7, Lcom/android/server/AppOpsService$Op;->mode:I

    .line 446
    const/4 v6, 0x1

    .line 447
    iget v0, v7, Lcom/android/server/AppOpsService$Op;->op:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AppOpsService;->mOpModeWatchers:Landroid/util/SparseArray;

    move-object/from16 v21, v0

    iget v0, v7, Lcom/android/server/AppOpsService$Op;->op:I

    move/from16 v23, v0

    move-object/from16 v0, v21

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/util/ArrayList;

    move/from16 v0, v22

    move-object/from16 v1, v21

    invoke-static {v4, v15, v0, v1}, Lcom/android/server/AppOpsService;->addCallbacks(Ljava/util/HashMap;Ljava/lang/String;ILjava/util/ArrayList;)Ljava/util/HashMap;

    move-result-object v4

    .line 449
    iget v0, v7, Lcom/android/server/AppOpsService$Op;->op:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AppOpsService;->mPackageModeWatchers:Landroid/util/ArrayMap;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v15}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/util/ArrayList;

    move/from16 v0, v22

    move-object/from16 v1, v21

    invoke-static {v4, v15, v0, v1}, Lcom/android/server/AppOpsService;->addCallbacks(Ljava/util/HashMap;Ljava/lang/String;ILjava/util/ArrayList;)Ljava/util/HashMap;

    move-result-object v4

    .line 451
    iget-wide v0, v7, Lcom/android/server/AppOpsService$Op;->time:J

    move-wide/from16 v21, v0

    const-wide/16 v23, 0x0

    cmp-long v21, v21, v23

    if-nez v21, :cond_1

    iget-wide v0, v7, Lcom/android/server/AppOpsService$Op;->rejectTime:J

    move-wide/from16 v21, v0

    const-wide/16 v23, 0x0

    cmp-long v21, v21, v23

    if-nez v21, :cond_1

    .line 452
    move-object/from16 v0, v17

    invoke-virtual {v0, v14}, Lcom/android/server/AppOpsService$Ops;->removeAt(I)V

    .line 440
    :cond_1
    add-int/lit8 v14, v14, -0x1

    goto/16 :goto_2

    .restart local v20    # "suggestMode":I
    :cond_2
    move/from16 v20, v8

    .line 445
    goto :goto_3

    .line 456
    .end local v7    # "curOp":Lcom/android/server/AppOpsService$Op;
    .end local v8    # "defaultMode":I
    .end local v20    # "suggestMode":I
    :cond_3
    invoke-virtual/range {v17 .. v17}, Lcom/android/server/AppOpsService$Ops;->size()I

    move-result v21

    if-nez v21, :cond_0

    .line 457
    invoke-interface {v13}, Ljava/util/Iterator;->remove()V

    goto/16 :goto_1

    .line 467
    .end local v10    # "ent":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;"
    .end local v11    # "i":I
    .end local v13    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;>;"
    .end local v14    # "j":I
    .end local v15    # "packageName":Ljava/lang/String;
    .end local v16    # "packages":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;"
    .end local v17    # "pkgOps":Lcom/android/server/AppOpsService$Ops;
    :catchall_0
    move-exception v21

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v21

    .line 460
    .restart local v11    # "i":I
    .restart local v13    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;>;"
    .restart local v16    # "packages":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;"
    :cond_4
    :try_start_1
    invoke-virtual/range {v16 .. v16}, Ljava/util/HashMap;->size()I

    move-result v21

    if-nez v21, :cond_5

    .line 461
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v11}, Landroid/util/SparseArray;->removeAt(I)V

    .line 433
    :cond_5
    add-int/lit8 v11, v11, -0x1

    goto/16 :goto_0

    .line 464
    .end local v13    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;>;"
    .end local v16    # "packages":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;"
    :cond_6
    if-eqz v6, :cond_7

    .line 465
    invoke-direct/range {p0 .. p0}, Lcom/android/server/AppOpsService;->scheduleWriteNowLocked()V

    .line 467
    :cond_7
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 468
    if-eqz v4, :cond_9

    .line 469
    invoke-virtual {v4}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .local v12, "i$":Ljava/util/Iterator;
    :cond_8
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_9

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map$Entry;

    .line 470
    .local v9, "ent":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/android/server/AppOpsService$Callback;Ljava/util/ArrayList<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Integer;>;>;>;"
    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/server/AppOpsService$Callback;

    .line 471
    .local v5, "cb":Lcom/android/server/AppOpsService$Callback;
    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/util/ArrayList;

    .line 472
    .local v19, "reports":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Integer;>;>;"
    const/4 v11, 0x0

    :goto_4
    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    move-result v21

    move/from16 v0, v21

    if-ge v11, v0, :cond_8

    .line 473
    move-object/from16 v0, v19

    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Landroid/util/Pair;

    .line 475
    .local v18, "rep":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Integer;>;"
    :try_start_2
    iget-object v0, v5, Lcom/android/server/AppOpsService$Callback;->mCallback:Lcom/android/internal/app/IAppOpsCallback;

    move-object/from16 v22, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    move-object/from16 v21, v0

    check-cast v21, Ljava/lang/Integer;

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Integer;->intValue()I

    move-result v23

    move-object/from16 v0, v18

    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    move-object/from16 v21, v0

    check-cast v21, Ljava/lang/String;

    move-object/from16 v0, v22

    move/from16 v1, v23

    move-object/from16 v2, v21

    invoke-interface {v0, v1, v2}, Lcom/android/internal/app/IAppOpsCallback;->opChanged(ILjava/lang/String;)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0

    .line 472
    :goto_5
    add-int/lit8 v11, v11, 0x1

    goto :goto_4

    .line 481
    .end local v5    # "cb":Lcom/android/server/AppOpsService$Callback;
    .end local v9    # "ent":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/android/server/AppOpsService$Callback;Ljava/util/ArrayList<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Integer;>;>;>;"
    .end local v12    # "i$":Ljava/util/Iterator;
    .end local v18    # "rep":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Integer;>;"
    .end local v19    # "reports":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Integer;>;>;"
    :cond_9
    return-void

    .line 476
    .restart local v5    # "cb":Lcom/android/server/AppOpsService$Callback;
    .restart local v9    # "ent":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/android/server/AppOpsService$Callback;Ljava/util/ArrayList<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Integer;>;>;>;"
    .restart local v12    # "i$":Ljava/util/Iterator;
    .restart local v18    # "rep":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Integer;>;"
    .restart local v19    # "reports":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Integer;>;>;"
    :catch_0
    move-exception v21

    goto :goto_5
.end method

.method public setMode(IILjava/lang/String;I)V
    .locals 6
    .param p1, "code"    # I
    .param p2, "uid"    # I
    .param p3, "packageName"    # Ljava/lang/String;
    .param p4, "mode"    # I

    .prologue
    .line 368
    invoke-direct {p0, p1, p2, p3}, Lcom/android/server/AppOpsService;->verifyIncomingUidForWrite(IILjava/lang/String;)V

    .line 369
    invoke-direct {p0, p1}, Lcom/android/server/AppOpsService;->verifyIncomingOp(I)V

    .line 370
    const/4 v3, 0x0

    .line 371
    .local v3, "repCbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    invoke-static {p1}, Landroid/app/AppOpsManager;->opToSwitch(I)I

    move-result p1

    .line 372
    monitor-enter p0

    .line 373
    const/4 v5, 0x1

    :try_start_0
    invoke-direct {p0, p1, p2, p3, v5}, Lcom/android/server/AppOpsService;->getOpLocked(IILjava/lang/String;Z)Lcom/android/server/AppOpsService$Op;

    move-result-object v2

    .line 374
    .local v2, "op":Lcom/android/server/AppOpsService$Op;
    if-eqz v2, :cond_2

    .line 375
    iget v5, v2, Lcom/android/server/AppOpsService$Op;->mode:I

    if-eq v5, p4, :cond_2

    .line 376
    iput p4, v2, Lcom/android/server/AppOpsService$Op;->mode:I

    .line 377
    iget-object v5, p0, Lcom/android/server/AppOpsService;->mOpModeWatchers:Landroid/util/SparseArray;

    invoke-virtual {v5, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 378
    .local v0, "cbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    if-eqz v0, :cond_1

    .line 379
    if-nez v3, :cond_0

    .line 380
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .end local v3    # "repCbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    .local v4, "repCbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    move-object v3, v4

    .line 382
    .end local v4    # "repCbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    .restart local v3    # "repCbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    :cond_0
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    move-object v4, v3

    .line 384
    .end local v3    # "repCbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    .restart local v4    # "repCbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    :try_start_1
    iget-object v5, p0, Lcom/android/server/AppOpsService;->mPackageModeWatchers:Landroid/util/ArrayMap;

    invoke-virtual {v5, p3}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "cbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    check-cast v0, Ljava/util/ArrayList;

    .line 385
    .restart local v0    # "cbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    if-eqz v0, :cond_5

    .line 386
    if-nez v4, :cond_4

    .line 387
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 389
    .end local v4    # "repCbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    .restart local v3    # "repCbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    :goto_0
    :try_start_2
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 391
    :goto_1
    invoke-direct {p0}, Lcom/android/server/AppOpsService;->scheduleWriteNowLocked()V

    .line 394
    .end local v0    # "cbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    :cond_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 395
    if-eqz v3, :cond_3

    .line 396
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v1, v5, :cond_3

    .line 398
    :try_start_3
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/server/AppOpsService$Callback;

    iget-object v5, v5, Lcom/android/server/AppOpsService$Callback;->mCallback:Lcom/android/internal/app/IAppOpsCallback;

    invoke-interface {v5, p1, p3}, Lcom/android/internal/app/IAppOpsCallback;->opChanged(ILjava/lang/String;)V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_0

    .line 396
    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 394
    .end local v1    # "i":I
    .end local v2    # "op":Lcom/android/server/AppOpsService$Op;
    :catchall_0
    move-exception v5

    :goto_4
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v5

    .line 403
    .restart local v2    # "op":Lcom/android/server/AppOpsService$Op;
    :cond_3
    return-void

    .line 399
    .restart local v1    # "i":I
    :catch_0
    move-exception v5

    goto :goto_3

    .line 394
    .end local v1    # "i":I
    .end local v3    # "repCbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    .restart local v4    # "repCbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    :catchall_1
    move-exception v5

    move-object v3, v4

    .end local v4    # "repCbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    .restart local v3    # "repCbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    goto :goto_4

    .end local v3    # "repCbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    .restart local v0    # "cbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    .restart local v4    # "repCbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    :cond_4
    move-object v3, v4

    .end local v4    # "repCbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    .restart local v3    # "repCbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    goto :goto_0

    .end local v3    # "repCbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    .restart local v4    # "repCbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    :cond_5
    move-object v3, v4

    .end local v4    # "repCbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    .restart local v3    # "repCbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    goto :goto_1
.end method

.method public shutdown()V
    .locals 3

    .prologue
    .line 265
    const-string v1, "AppOps"

    const-string v2, "Writing app ops before shutdown..."

    invoke-static {v1, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 266
    const/4 v0, 0x0

    .line 267
    .local v0, "doWrite":Z
    monitor-enter p0

    .line 268
    :try_start_0
    iget-boolean v1, p0, Lcom/android/server/AppOpsService;->mWriteScheduled:Z

    if-eqz v1, :cond_0

    .line 269
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/server/AppOpsService;->mWriteScheduled:Z

    .line 270
    const/4 v0, 0x1

    .line 272
    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 273
    if-eqz v0, :cond_1

    .line 274
    invoke-virtual {p0}, Lcom/android/server/AppOpsService;->writeState()V

    .line 276
    :cond_1
    return-void

    .line 272
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public startOperation(Landroid/os/IBinder;IILjava/lang/String;)I
    .locals 11
    .param p1, "token"    # Landroid/os/IBinder;
    .param p2, "code"    # I
    .param p3, "uid"    # I
    .param p4, "packageName"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x2

    const/4 v5, 0x1

    .line 669
    invoke-direct {p0, p3}, Lcom/android/server/AppOpsService;->verifyIncomingUidForRead(I)V

    .line 670
    invoke-direct {p0, p2}, Lcom/android/server/AppOpsService;->verifyIncomingOp(I)V

    move-object v6, p1

    .line 671
    check-cast v6, Lcom/android/server/AppOpsService$ClientState;

    .line 673
    .local v6, "client":Lcom/android/server/AppOpsService$ClientState;
    const/4 v8, 0x0

    .line 674
    .local v8, "ops":Lcom/android/server/AppOpsService$Ops;
    const/4 v7, 0x0

    .local v7, "op":Lcom/android/server/AppOpsService$Op;
    const/4 v9, 0x0

    .line 676
    .local v9, "switchOp":Lcom/android/server/AppOpsService$Op;
    monitor-enter p0

    .line 677
    const/4 v0, 0x1

    :try_start_0
    invoke-direct {p0, p3, p4, v0}, Lcom/android/server/AppOpsService;->getOpsLocked(ILjava/lang/String;Z)Lcom/android/server/AppOpsService$Ops;

    move-result-object v8

    .line 678
    if-nez v8, :cond_0

    .line 681
    const/4 v4, 0x2

    const/4 v5, 0x1

    move-object v0, p0

    move v1, p3

    move-object v2, p4

    move v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/android/server/AppOpsService;->onAppApplyOperation(ILjava/lang/String;IIZ)V

    .line 682
    monitor-exit p0

    move v4, v10

    .line 716
    :goto_0
    return v4

    .line 684
    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v8, p2, v0}, Lcom/android/server/AppOpsService;->getOpLocked(Lcom/android/server/AppOpsService$Ops;IZ)Lcom/android/server/AppOpsService$Op;

    move-result-object v7

    .line 685
    invoke-static {p2}, Landroid/app/AppOpsManager;->opToSwitch(I)I

    move-result v3

    .line 686
    .local v3, "switchCode":I
    if-eq v3, p2, :cond_5

    const/4 v0, 0x1

    invoke-direct {p0, v8, v3, v0}, Lcom/android/server/AppOpsService;->getOpLocked(Lcom/android/server/AppOpsService$Ops;IZ)Lcom/android/server/AppOpsService$Op;

    move-result-object v9

    .line 687
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 688
    iget v4, v9, Lcom/android/server/AppOpsService$Op;->mode:I

    .line 689
    .local v4, "resultMode":I
    invoke-direct {p0, p2}, Lcom/android/server/AppOpsService;->isAppPermissionControlOpen(I)Z

    move-result v0

    if-nez v0, :cond_6

    .line 690
    const/4 v4, 0x0

    .line 695
    :cond_1
    :goto_2
    const/4 v0, 0x3

    if-ne v4, v0, :cond_2

    .line 696
    invoke-direct {p0, v3, p3, p4}, Lcom/android/server/AppOpsService;->askOperationLocked(IILjava/lang/String;)I

    move-result v4

    .line 698
    :cond_2
    if-eq v4, v5, :cond_3

    if-ne v4, v10, :cond_7

    .line 701
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, v7, Lcom/android/server/AppOpsService$Op;->rejectTime:J

    :cond_4
    :goto_3
    move-object v0, p0

    move v1, p3

    move-object v2, p4

    .line 715
    invoke-direct/range {v0 .. v5}, Lcom/android/server/AppOpsService;->onAppApplyOperation(ILjava/lang/String;IIZ)V

    goto :goto_0

    .end local v4    # "resultMode":I
    :cond_5
    move-object v9, v7

    .line 686
    goto :goto_1

    .line 687
    .end local v3    # "switchCode":I
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 691
    .restart local v3    # "switchCode":I
    .restart local v4    # "resultMode":I
    :cond_6
    invoke-direct {p0, p2, p3, p4}, Lcom/android/server/AppOpsService;->isMiuiAllowed(IILjava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 692
    const/4 v0, 0x0

    iput v0, v9, Lcom/android/server/AppOpsService$Op;->mode:I

    .line 693
    const/4 v4, 0x0

    goto :goto_2

    .line 702
    :cond_7
    if-nez v4, :cond_4

    .line 705
    iget v0, v7, Lcom/android/server/AppOpsService$Op;->nesting:I

    if-nez v0, :cond_8

    .line 706
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, v7, Lcom/android/server/AppOpsService$Op;->time:J

    .line 707
    const-wide/16 v0, 0x0

    iput-wide v0, v7, Lcom/android/server/AppOpsService$Op;->rejectTime:J

    .line 708
    const/4 v0, -0x1

    iput v0, v7, Lcom/android/server/AppOpsService$Op;->duration:I

    .line 710
    :cond_8
    iget v0, v7, Lcom/android/server/AppOpsService$Op;->nesting:I

    add-int/lit8 v0, v0, 0x1

    iput v0, v7, Lcom/android/server/AppOpsService$Op;->nesting:I

    .line 711
    iget-object v0, v6, Lcom/android/server/AppOpsService$ClientState;->mStartedOps:Ljava/util/ArrayList;

    if-eqz v0, :cond_4

    .line 712
    iget-object v0, v6, Lcom/android/server/AppOpsService$ClientState;->mStartedOps:Ljava/util/ArrayList;

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3
.end method

.method public startWatchingMode(ILjava/lang/String;Lcom/android/internal/app/IAppOpsCallback;)V
    .locals 4
    .param p1, "op"    # I
    .param p2, "packageName"    # Ljava/lang/String;
    .param p3, "callback"    # Lcom/android/internal/app/IAppOpsCallback;

    .prologue
    .line 511
    monitor-enter p0

    .line 512
    :try_start_0
    invoke-static {p1}, Landroid/app/AppOpsManager;->opToSwitch(I)I

    move-result p1

    .line 513
    iget-object v2, p0, Lcom/android/server/AppOpsService;->mModeWatchers:Landroid/util/ArrayMap;

    invoke-interface {p3}, Lcom/android/internal/app/IAppOpsCallback;->asBinder()Landroid/os/IBinder;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/AppOpsService$Callback;

    .line 514
    .local v0, "cb":Lcom/android/server/AppOpsService$Callback;
    if-nez v0, :cond_0

    .line 515
    new-instance v0, Lcom/android/server/AppOpsService$Callback;

    .end local v0    # "cb":Lcom/android/server/AppOpsService$Callback;
    invoke-direct {v0, p0, p3}, Lcom/android/server/AppOpsService$Callback;-><init>(Lcom/android/server/AppOpsService;Lcom/android/internal/app/IAppOpsCallback;)V

    .line 516
    .restart local v0    # "cb":Lcom/android/server/AppOpsService$Callback;
    iget-object v2, p0, Lcom/android/server/AppOpsService;->mModeWatchers:Landroid/util/ArrayMap;

    invoke-interface {p3}, Lcom/android/internal/app/IAppOpsCallback;->asBinder()Landroid/os/IBinder;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 518
    :cond_0
    const/4 v2, -0x1

    if-eq p1, v2, :cond_2

    .line 519
    iget-object v2, p0, Lcom/android/server/AppOpsService;->mOpModeWatchers:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    .line 520
    .local v1, "cbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    if-nez v1, :cond_1

    .line 521
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "cbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 522
    .restart local v1    # "cbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    iget-object v2, p0, Lcom/android/server/AppOpsService;->mOpModeWatchers:Landroid/util/SparseArray;

    invoke-virtual {v2, p1, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 524
    :cond_1
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 526
    .end local v1    # "cbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    :cond_2
    if-eqz p2, :cond_4

    .line 527
    iget-object v2, p0, Lcom/android/server/AppOpsService;->mPackageModeWatchers:Landroid/util/ArrayMap;

    invoke-virtual {v2, p2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    .line 528
    .restart local v1    # "cbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    if-nez v1, :cond_3

    .line 529
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "cbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 530
    .restart local v1    # "cbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    iget-object v2, p0, Lcom/android/server/AppOpsService;->mPackageModeWatchers:Landroid/util/ArrayMap;

    invoke-virtual {v2, p2, v1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 532
    :cond_3
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 534
    .end local v1    # "cbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    :cond_4
    monitor-exit p0

    .line 535
    return-void

    .line 534
    .end local v0    # "cb":Lcom/android/server/AppOpsService$Callback;
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public stopWatchingMode(Lcom/android/internal/app/IAppOpsCallback;)V
    .locals 5
    .param p1, "callback"    # Lcom/android/internal/app/IAppOpsCallback;

    .prologue
    .line 539
    monitor-enter p0

    .line 540
    :try_start_0
    iget-object v3, p0, Lcom/android/server/AppOpsService;->mModeWatchers:Landroid/util/ArrayMap;

    invoke-interface {p1}, Lcom/android/internal/app/IAppOpsCallback;->asBinder()Landroid/os/IBinder;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/AppOpsService$Callback;

    .line 541
    .local v0, "cb":Lcom/android/server/AppOpsService$Callback;
    if-eqz v0, :cond_3

    .line 542
    invoke-virtual {v0}, Lcom/android/server/AppOpsService$Callback;->unlinkToDeath()V

    .line 543
    iget-object v3, p0, Lcom/android/server/AppOpsService;->mOpModeWatchers:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v3

    add-int/lit8 v2, v3, -0x1

    .local v2, "i":I
    :goto_0
    if-ltz v2, :cond_1

    .line 544
    iget-object v3, p0, Lcom/android/server/AppOpsService;->mOpModeWatchers:Landroid/util/SparseArray;

    invoke-virtual {v3, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    .line 545
    .local v1, "cbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 546
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-gtz v3, :cond_0

    .line 547
    iget-object v3, p0, Lcom/android/server/AppOpsService;->mOpModeWatchers:Landroid/util/SparseArray;

    invoke-virtual {v3, v2}, Landroid/util/SparseArray;->removeAt(I)V

    .line 543
    :cond_0
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 550
    .end local v1    # "cbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    :cond_1
    iget-object v3, p0, Lcom/android/server/AppOpsService;->mPackageModeWatchers:Landroid/util/ArrayMap;

    invoke-virtual {v3}, Landroid/util/ArrayMap;->size()I

    move-result v3

    add-int/lit8 v2, v3, -0x1

    :goto_1
    if-ltz v2, :cond_3

    .line 551
    iget-object v3, p0, Lcom/android/server/AppOpsService;->mPackageModeWatchers:Landroid/util/ArrayMap;

    invoke-virtual {v3, v2}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    .line 552
    .restart local v1    # "cbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 553
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-gtz v3, :cond_2

    .line 554
    iget-object v3, p0, Lcom/android/server/AppOpsService;->mPackageModeWatchers:Landroid/util/ArrayMap;

    invoke-virtual {v3, v2}, Landroid/util/ArrayMap;->removeAt(I)Ljava/lang/Object;

    .line 550
    :cond_2
    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    .line 558
    .end local v1    # "cbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AppOpsService$Callback;>;"
    .end local v2    # "i":I
    :cond_3
    monitor-exit p0

    .line 559
    return-void

    .line 558
    .end local v0    # "cb":Lcom/android/server/AppOpsService$Callback;
    :catchall_0
    move-exception v3

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method

.method public systemReady()V
    .locals 10

    .prologue
    .line 210
    monitor-enter p0

    .line 211
    const/4 v0, 0x0

    .line 212
    .local v0, "changed":Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    :try_start_0
    iget-object v7, p0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    invoke-virtual {v7}, Landroid/util/SparseArray;->size()I

    move-result v7

    if-ge v3, v7, :cond_3

    .line 213
    iget-object v7, p0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    invoke-virtual {v7, v3}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/HashMap;

    .line 214
    .local v6, "pkgs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;"
    invoke-virtual {v6}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 215
    .local v4, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/android/server/AppOpsService$Ops;>;"
    :cond_0
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 216
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/server/AppOpsService$Ops;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 219
    .local v5, "ops":Lcom/android/server/AppOpsService$Ops;
    :try_start_1
    iget-object v7, p0, Lcom/android/server/AppOpsService;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    iget-object v8, v5, Lcom/android/server/AppOpsService$Ops;->packageName:Ljava/lang/String;

    iget v9, v5, Lcom/android/server/AppOpsService$Ops;->uid:I

    invoke-static {v9}, Landroid/os/UserHandle;->getUserId(I)I

    move-result v9

    invoke-virtual {v7, v8, v9}, Landroid/content/pm/PackageManager;->getPackageUid(Ljava/lang/String;I)I
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v1

    .line 224
    .local v1, "curUid":I
    :goto_2
    :try_start_2
    iget v7, v5, Lcom/android/server/AppOpsService$Ops;->uid:I

    if-eq v1, v7, :cond_0

    .line 225
    const-string v7, "AppOps"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Pruning old package "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, v5, Lcom/android/server/AppOpsService$Ops;->packageName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v5, Lcom/android/server/AppOpsService$Ops;->uid:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ": new uid="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    .line 228
    const/4 v0, 0x1

    goto :goto_1

    .line 221
    .end local v1    # "curUid":I
    :catch_0
    move-exception v2

    .line 222
    .local v2, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v1, -0x1

    .restart local v1    # "curUid":I
    goto :goto_2

    .line 231
    .end local v1    # "curUid":I
    .end local v2    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v5    # "ops":Lcom/android/server/AppOpsService$Ops;
    :cond_1
    invoke-virtual {v6}, Ljava/util/HashMap;->size()I

    move-result v7

    if-gtz v7, :cond_2

    .line 232
    iget-object v7, p0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    invoke-virtual {v7, v3}, Landroid/util/SparseArray;->removeAt(I)V

    .line 212
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 235
    .end local v4    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/android/server/AppOpsService$Ops;>;"
    .end local v6    # "pkgs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/android/server/AppOpsService$Ops;>;"
    :cond_3
    if-eqz v0, :cond_4

    .line 236
    invoke-direct {p0}, Lcom/android/server/AppOpsService;->scheduleWriteLocked()V

    .line 238
    :cond_4
    monitor-exit p0

    .line 239
    return-void

    .line 238
    :catchall_0
    move-exception v7

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v7
.end method

.method public uidRemoved(I)V
    .locals 1
    .param p1, "uid"    # I

    .prologue
    .line 256
    monitor-enter p0

    .line 257
    :try_start_0
    iget-object v0, p0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->indexOfKey(I)I

    move-result v0

    if-ltz v0, :cond_0

    .line 258
    iget-object v0, p0, Lcom/android/server/AppOpsService;->mUidOps:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 259
    invoke-direct {p0}, Lcom/android/server/AppOpsService;->scheduleWriteLocked()V

    .line 261
    :cond_0
    monitor-exit p0

    .line 262
    return-void

    .line 261
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method writeState()V
    .locals 22

    .prologue
    .line 1046
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AppOpsService;->mFile:Landroid/util/AtomicFile;

    move-object/from16 v18, v0

    monitor-enter v18

    .line 1047
    const/16 v17, 0x0

    :try_start_0
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/android/server/AppOpsService;->getPackagesForOps([I)Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v4

    .line 1051
    .local v4, "allOps":Ljava/util/List;, "Ljava/util/List<Landroid/app/AppOpsManager$PackageOps;>;"
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AppOpsService;->mFile:Landroid/util/AtomicFile;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/util/AtomicFile;->startWrite()Ljava/io/FileOutputStream;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v14

    .line 1058
    .local v14, "stream":Ljava/io/FileOutputStream;
    :try_start_2
    new-instance v12, Lcom/android/internal/util/FastXmlSerializer;

    invoke-direct {v12}, Lcom/android/internal/util/FastXmlSerializer;-><init>()V

    .line 1059
    .local v12, "out":Lorg/xmlpull/v1/XmlSerializer;
    const-string v17, "utf-8"

    move-object/from16 v0, v17

    invoke-interface {v12, v14, v0}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 1060
    const/16 v17, 0x0

    const/16 v19, 0x1

    invoke-static/range {v19 .. v19}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 1061
    const/16 v17, 0x0

    const-string v19, "app-ops"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1063
    if-eqz v4, :cond_8

    .line 1064
    const/4 v9, 0x0

    .line 1065
    .local v9, "lastPkg":Ljava/lang/String;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v17

    move/from16 v0, v17

    if-ge v7, v0, :cond_7

    .line 1066
    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/app/AppOpsManager$PackageOps;

    .line 1067
    .local v13, "pkg":Landroid/app/AppOpsManager$PackageOps;
    invoke-virtual {v13}, Landroid/app/AppOpsManager$PackageOps;->getPackageName()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_1

    .line 1068
    if-eqz v9, :cond_0

    .line 1069
    const/16 v17, 0x0

    const-string v19, "pkg"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1071
    :cond_0
    invoke-virtual {v13}, Landroid/app/AppOpsManager$PackageOps;->getPackageName()Ljava/lang/String;

    move-result-object v9

    .line 1072
    const/16 v17, 0x0

    const-string v19, "pkg"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1073
    const/16 v17, 0x0

    const-string v19, "n"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-interface {v12, v0, v1, v9}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1075
    :cond_1
    const/16 v17, 0x0

    const-string v19, "uid"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1076
    const/16 v17, 0x0

    const-string v19, "n"

    invoke-virtual {v13}, Landroid/app/AppOpsManager$PackageOps;->getUid()I

    move-result v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-interface {v12, v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1077
    invoke-virtual {v13}, Landroid/app/AppOpsManager$PackageOps;->getOps()Ljava/util/List;

    move-result-object v11

    .line 1078
    .local v11, "ops":Ljava/util/List;, "Ljava/util/List<Landroid/app/AppOpsManager$OpEntry;>;"
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_1
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v17

    move/from16 v0, v17

    if-ge v8, v0, :cond_6

    .line 1079
    invoke-interface {v11, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/app/AppOpsManager$OpEntry;

    .line 1080
    .local v10, "op":Landroid/app/AppOpsManager$OpEntry;
    const/16 v17, 0x0

    const-string v19, "op"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1081
    const/16 v17, 0x0

    const-string v19, "n"

    invoke-virtual {v10}, Landroid/app/AppOpsManager$OpEntry;->getOp()I

    move-result v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-interface {v12, v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1082
    invoke-virtual {v10}, Landroid/app/AppOpsManager$OpEntry;->getMode()I

    move-result v17

    invoke-virtual {v10}, Landroid/app/AppOpsManager$OpEntry;->getOp()I

    move-result v19

    invoke-virtual {v13}, Landroid/app/AppOpsManager$PackageOps;->getUid()I

    move-result v20

    invoke-virtual {v13}, Landroid/app/AppOpsManager$PackageOps;->getPackageName()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    move-object/from16 v3, v21

    invoke-direct {v0, v1, v2, v3}, Lcom/android/server/AppOpsService;->getDefaultMode(IILjava/lang/String;)I

    move-result v19

    move/from16 v0, v17

    move/from16 v1, v19

    if-eq v0, v1, :cond_2

    .line 1084
    const/16 v17, 0x0

    const-string v19, "m"

    invoke-virtual {v10}, Landroid/app/AppOpsManager$OpEntry;->getMode()I

    move-result v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-interface {v12, v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1086
    :cond_2
    invoke-virtual {v10}, Landroid/app/AppOpsManager$OpEntry;->getTime()J

    move-result-wide v15

    .line 1087
    .local v15, "time":J
    const-wide/16 v19, 0x0

    cmp-long v17, v15, v19

    if-eqz v17, :cond_3

    .line 1088
    const/16 v17, 0x0

    const-string v19, "t"

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-interface {v12, v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1090
    :cond_3
    invoke-virtual {v10}, Landroid/app/AppOpsManager$OpEntry;->getRejectTime()J

    move-result-wide v15

    .line 1091
    const-wide/16 v19, 0x0

    cmp-long v17, v15, v19

    if-eqz v17, :cond_4

    .line 1092
    const/16 v17, 0x0

    const-string v19, "r"

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-interface {v12, v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1094
    :cond_4
    invoke-virtual {v10}, Landroid/app/AppOpsManager$OpEntry;->getDuration()I

    move-result v5

    .line 1095
    .local v5, "dur":I
    if-eqz v5, :cond_5

    .line 1096
    const/16 v17, 0x0

    const-string v19, "d"

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-interface {v12, v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1098
    :cond_5
    const/16 v17, 0x0

    const-string v19, "op"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1078
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_1

    .line 1052
    .end local v5    # "dur":I
    .end local v7    # "i":I
    .end local v8    # "j":I
    .end local v9    # "lastPkg":Ljava/lang/String;
    .end local v10    # "op":Landroid/app/AppOpsManager$OpEntry;
    .end local v11    # "ops":Ljava/util/List;, "Ljava/util/List<Landroid/app/AppOpsManager$OpEntry;>;"
    .end local v12    # "out":Lorg/xmlpull/v1/XmlSerializer;
    .end local v13    # "pkg":Landroid/app/AppOpsManager$PackageOps;
    .end local v14    # "stream":Ljava/io/FileOutputStream;
    .end local v15    # "time":J
    :catch_0
    move-exception v6

    .line 1053
    .local v6, "e":Ljava/io/IOException;
    :try_start_3
    const-string v17, "AppOps"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Failed to write state: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1054
    monitor-exit v18
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1115
    .end local v6    # "e":Ljava/io/IOException;
    :goto_2
    return-void

    .line 1100
    .restart local v7    # "i":I
    .restart local v8    # "j":I
    .restart local v9    # "lastPkg":Ljava/lang/String;
    .restart local v11    # "ops":Ljava/util/List;, "Ljava/util/List<Landroid/app/AppOpsManager$OpEntry;>;"
    .restart local v12    # "out":Lorg/xmlpull/v1/XmlSerializer;
    .restart local v13    # "pkg":Landroid/app/AppOpsManager$PackageOps;
    .restart local v14    # "stream":Ljava/io/FileOutputStream;
    :cond_6
    const/16 v17, 0x0

    :try_start_4
    const-string v19, "uid"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1065
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_0

    .line 1102
    .end local v8    # "j":I
    .end local v11    # "ops":Ljava/util/List;, "Ljava/util/List<Landroid/app/AppOpsManager$OpEntry;>;"
    .end local v13    # "pkg":Landroid/app/AppOpsManager$PackageOps;
    :cond_7
    if-eqz v9, :cond_8

    .line 1103
    const/16 v17, 0x0

    const-string v19, "pkg"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1107
    .end local v7    # "i":I
    .end local v9    # "lastPkg":Ljava/lang/String;
    :cond_8
    const/16 v17, 0x0

    const-string v19, "app-ops"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 1108
    invoke-interface {v12}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V

    .line 1109
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AppOpsService;->mFile:Landroid/util/AtomicFile;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v14}, Landroid/util/AtomicFile;->finishWrite(Ljava/io/FileOutputStream;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 1114
    .end local v12    # "out":Lorg/xmlpull/v1/XmlSerializer;
    :goto_3
    :try_start_5
    monitor-exit v18

    goto :goto_2

    .end local v4    # "allOps":Ljava/util/List;, "Ljava/util/List<Landroid/app/AppOpsManager$PackageOps;>;"
    .end local v14    # "stream":Ljava/io/FileOutputStream;
    :catchall_0
    move-exception v17

    monitor-exit v18
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw v17

    .line 1110
    .restart local v4    # "allOps":Ljava/util/List;, "Ljava/util/List<Landroid/app/AppOpsManager$PackageOps;>;"
    .restart local v14    # "stream":Ljava/io/FileOutputStream;
    :catch_1
    move-exception v6

    .line 1111
    .restart local v6    # "e":Ljava/io/IOException;
    :try_start_6
    const-string v17, "AppOps"

    const-string v19, "Failed to write state, restoring backup."

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-static {v0, v1, v6}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1112
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/AppOpsService;->mFile:Landroid/util/AtomicFile;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v14}, Landroid/util/AtomicFile;->failWrite(Ljava/io/FileOutputStream;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_3
.end method
