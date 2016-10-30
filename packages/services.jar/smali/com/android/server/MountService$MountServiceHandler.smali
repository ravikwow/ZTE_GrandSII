.class Lcom/android/server/MountService$MountServiceHandler;
.super Landroid/os/Handler;
.source "MountService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/MountService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MountServiceHandler"
.end annotation


# instance fields
.field mForceUnmounts:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/MountService$UnmountCallBack;",
            ">;"
        }
    .end annotation
.end field

.field mUpdatingStatus:Z

.field final synthetic this$0:Lcom/android/server/MountService;


# direct methods
.method constructor <init>(Lcom/android/server/MountService;Landroid/os/Looper;)V
    .locals 1
    .param p2, "l"    # Landroid/os/Looper;

    .prologue
    .line 455
    iput-object p1, p0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    .line 456
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 452
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/server/MountService$MountServiceHandler;->mForceUnmounts:Ljava/util/ArrayList;

    .line 453
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/MountService$MountServiceHandler;->mUpdatingStatus:Z

    .line 457
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 28
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 461
    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->what:I

    move/from16 v23, v0

    packed-switch v23, :pswitch_data_0

    .line 566
    :cond_0
    :goto_0
    return-void

    .line 463
    :pswitch_0
    const-string v23, "MountService"

    const-string v24, "H_UNMOUNT_PM_UPDATE"

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 464
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v22, v0

    check-cast v22, Lcom/android/server/MountService$UnmountCallBack;

    .line 465
    .local v22, "ucb":Lcom/android/server/MountService$UnmountCallBack;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->mForceUnmounts:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 466
    const-string v23, "MountService"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, " registered = "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/server/MountService$MountServiceHandler;->mUpdatingStatus:Z

    move/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 468
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/server/MountService$MountServiceHandler;->mUpdatingStatus:Z

    move/from16 v23, v0

    if-nez v23, :cond_0

    .line 469
    const-string v23, "MountService"

    const-string v24, "Updating external media status on PackageManager"

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 470
    const/16 v23, 0x1

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/server/MountService$MountServiceHandler;->mUpdatingStatus:Z

    .line 471
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    # getter for: Lcom/android/server/MountService;->mPms:Lcom/android/server/pm/PackageManagerService;
    invoke-static/range {v23 .. v23}, Lcom/android/server/MountService;->access$700(Lcom/android/server/MountService;)Lcom/android/server/pm/PackageManagerService;

    move-result-object v23

    const/16 v24, 0x0

    const/16 v25, 0x1

    invoke-virtual/range {v23 .. v25}, Lcom/android/server/pm/PackageManagerService;->updateExternalMediaStatus(ZZ)V

    goto :goto_0

    .line 476
    .end local v22    # "ucb":Lcom/android/server/MountService$UnmountCallBack;
    :pswitch_1
    const-string v23, "MountService"

    const-string v24, "H_UNMOUNT_PM_DONE"

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 477
    const-string v23, "MountService"

    const-string v24, "Updated status. Processing requests"

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 478
    const/16 v23, 0x0

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/server/MountService$MountServiceHandler;->mUpdatingStatus:Z

    .line 479
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->mForceUnmounts:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/ArrayList;->size()I

    move-result v18

    .line 480
    .local v18, "size":I
    move/from16 v0, v18

    new-array v0, v0, [I

    move-object/from16 v19, v0

    .line 481
    .local v19, "sizeArr":[I
    const/16 v20, 0x0

    .line 483
    .local v20, "sizeArrN":I
    const-string v23, "activity"

    invoke-static/range {v23 .. v23}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v5

    check-cast v5, Lcom/android/server/am/ActivityManagerService;

    .line 485
    .local v5, "ams":Lcom/android/server/am/ActivityManagerService;
    const/4 v9, 0x0

    .local v9, "i":I
    move/from16 v21, v20

    .end local v20    # "sizeArrN":I
    .local v21, "sizeArrN":I
    :goto_1
    move/from16 v0, v18

    if-ge v9, v0, :cond_b

    .line 486
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->mForceUnmounts:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lcom/android/server/MountService$UnmountCallBack;

    .line 487
    .restart local v22    # "ucb":Lcom/android/server/MountService$UnmountCallBack;
    move-object/from16 v0, v22

    iget-object v14, v0, Lcom/android/server/MountService$UnmountCallBack;->path:Ljava/lang/String;

    .line 488
    .local v14, "path":Ljava/lang/String;
    const/4 v7, 0x0

    .line 489
    .local v7, "done":Z
    move-object/from16 v0, v22

    iget-boolean v0, v0, Lcom/android/server/MountService$UnmountCallBack;->force:Z

    move/from16 v23, v0

    if-nez v23, :cond_2

    .line 490
    const/4 v7, 0x1

    .line 505
    :cond_1
    :goto_2
    if-nez v7, :cond_6

    move-object/from16 v0, v22

    iget v0, v0, Lcom/android/server/MountService$UnmountCallBack;->retries:I

    move/from16 v23, v0

    const/16 v24, 0x2

    move/from16 v0, v23

    move/from16 v1, v24

    if-ge v0, v1, :cond_6

    .line 507
    const-string v23, "MountService"

    const-string v24, "Retrying to kill storage users again"

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 508
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    # getter for: Lcom/android/server/MountService;->mHandler:Landroid/os/Handler;
    invoke-static/range {v23 .. v23}, Lcom/android/server/MountService;->access$800(Lcom/android/server/MountService;)Landroid/os/Handler;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v24, v0

    # getter for: Lcom/android/server/MountService;->mHandler:Landroid/os/Handler;
    invoke-static/range {v24 .. v24}, Lcom/android/server/MountService;->access$800(Lcom/android/server/MountService;)Landroid/os/Handler;

    move-result-object v24

    const/16 v25, 0x2

    move-object/from16 v0, v22

    iget v0, v0, Lcom/android/server/MountService$UnmountCallBack;->retries:I

    move/from16 v26, v0

    add-int/lit8 v27, v26, 0x1

    move/from16 v0, v27

    move-object/from16 v1, v22

    iput v0, v1, Lcom/android/server/MountService$UnmountCallBack;->retries:I

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v24 .. v26}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v24

    const-wide/16 v25, 0x1e

    invoke-virtual/range {v23 .. v26}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    move/from16 v20, v21

    .line 485
    .end local v21    # "sizeArrN":I
    .restart local v20    # "sizeArrN":I
    :goto_3
    add-int/lit8 v9, v9, 0x1

    move/from16 v21, v20

    .end local v20    # "sizeArrN":I
    .restart local v21    # "sizeArrN":I
    goto :goto_1

    .line 492
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v14}, Lcom/android/server/MountService;->getStorageUsers(Ljava/lang/String;)[I

    move-result-object v15

    .line 493
    .local v15, "pids":[I
    if-eqz v15, :cond_3

    array-length v0, v15

    move/from16 v23, v0

    if-nez v23, :cond_4

    .line 494
    :cond_3
    const/4 v7, 0x1

    goto :goto_2

    .line 497
    :cond_4
    const-string v23, "unmount media"

    const/16 v24, 0x1

    move-object/from16 v0, v23

    move/from16 v1, v24

    invoke-virtual {v5, v15, v0, v1}, Lcom/android/server/am/ActivityManagerService;->killPids([ILjava/lang/String;Z)Z

    .line 499
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v14}, Lcom/android/server/MountService;->getStorageUsers(Ljava/lang/String;)[I

    move-result-object v15

    .line 500
    if-eqz v15, :cond_5

    array-length v0, v15

    move/from16 v23, v0

    if-nez v23, :cond_1

    .line 501
    :cond_5
    const/4 v7, 0x1

    goto/16 :goto_2

    .line 513
    .end local v15    # "pids":[I
    :cond_6
    move-object/from16 v0, v22

    iget v0, v0, Lcom/android/server/MountService$UnmountCallBack;->retries:I

    move/from16 v23, v0

    const/16 v24, 0x2

    move/from16 v0, v23

    move/from16 v1, v24

    if-lt v0, v1, :cond_a

    .line 515
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    # getter for: Lcom/android/server/MountService;->mContext:Landroid/content/Context;
    invoke-static/range {v23 .. v23}, Lcom/android/server/MountService;->access$900(Lcom/android/server/MountService;)Landroid/content/Context;

    move-result-object v23

    const-string v24, "activity"

    invoke-virtual/range {v23 .. v24}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/ActivityManager;

    .line 516
    .local v4, "am":Landroid/app/ActivityManager;
    if-eqz v4, :cond_9

    .line 517
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v14}, Lcom/android/server/MountService;->getStorageUsersProcessName(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v17

    .line 518
    .local v17, "processnames":[Ljava/lang/String;
    if-eqz v17, :cond_9

    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v23, v0

    if-eqz v23, :cond_9

    .line 519
    invoke-virtual {v4}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v13

    .line 520
    .local v13, "listRun":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    move-object/from16 v6, v17

    .local v6, "arr$":[Ljava/lang/String;
    array-length v12, v6

    .local v12, "len$":I
    const/4 v10, 0x0

    .local v10, "i$":I
    move v11, v10

    .end local v10    # "i$":I
    .local v11, "i$":I
    :goto_4
    if-ge v11, v12, :cond_9

    aget-object v16, v6, v11

    .line 521
    .local v16, "processname":Ljava/lang/String;
    const-string v23, "MountService"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "processname:="

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 522
    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .end local v11    # "i$":I
    .local v10, "i$":Ljava/util/Iterator;
    :cond_7
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_8

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 523
    .local v3, "Run":Landroid/app/ActivityManager$RunningAppProcessInfo;
    const-string v23, "MountService"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "Run.processName:="

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    iget-object v0, v3, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 524
    iget-object v0, v3, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_7

    .line 525
    const-string v23, "MountService"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "Run.pkgList[0]:="

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    iget-object v0, v3, Landroid/app/ActivityManager$RunningAppProcessInfo;->pkgList:[Ljava/lang/String;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    aget-object v25, v25, v26

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 526
    iget-object v0, v3, Landroid/app/ActivityManager$RunningAppProcessInfo;->pkgList:[Ljava/lang/String;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aget-object v23, v23, v24

    move-object/from16 v0, v23

    invoke-virtual {v4, v0}, Landroid/app/ActivityManager;->forceStopPackage(Ljava/lang/String;)V

    .line 520
    .end local v3    # "Run":Landroid/app/ActivityManager$RunningAppProcessInfo;
    :cond_8
    add-int/lit8 v10, v11, 0x1

    .local v10, "i$":I
    move v11, v10

    .end local v10    # "i$":I
    .restart local v11    # "i$":I
    goto/16 :goto_4

    .line 534
    .end local v6    # "arr$":[Ljava/lang/String;
    .end local v11    # "i$":I
    .end local v12    # "len$":I
    .end local v13    # "listRun":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    .end local v16    # "processname":Ljava/lang/String;
    .end local v17    # "processnames":[Ljava/lang/String;
    :cond_9
    const-string v23, "MountService"

    const-string v24, "Failed to unmount media inspite of 2 retries. Forcibly killing processes now"

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 537
    .end local v4    # "am":Landroid/app/ActivityManager;
    :cond_a
    add-int/lit8 v20, v21, 0x1

    .end local v21    # "sizeArrN":I
    .restart local v20    # "sizeArrN":I
    aput v9, v19, v21

    .line 538
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    # getter for: Lcom/android/server/MountService;->mHandler:Landroid/os/Handler;
    invoke-static/range {v23 .. v23}, Lcom/android/server/MountService;->access$800(Lcom/android/server/MountService;)Landroid/os/Handler;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v24, v0

    # getter for: Lcom/android/server/MountService;->mHandler:Landroid/os/Handler;
    invoke-static/range {v24 .. v24}, Lcom/android/server/MountService;->access$800(Lcom/android/server/MountService;)Landroid/os/Handler;

    move-result-object v24

    const/16 v25, 0x3

    move-object/from16 v0, v24

    move/from16 v1, v25

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_3

    .line 543
    .end local v7    # "done":Z
    .end local v14    # "path":Ljava/lang/String;
    .end local v20    # "sizeArrN":I
    .end local v22    # "ucb":Lcom/android/server/MountService$UnmountCallBack;
    .restart local v21    # "sizeArrN":I
    :cond_b
    add-int/lit8 v9, v21, -0x1

    :goto_5
    if-ltz v9, :cond_0

    .line 544
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->mForceUnmounts:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    aget v24, v19, v9

    invoke-virtual/range {v23 .. v24}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 543
    add-int/lit8 v9, v9, -0x1

    goto :goto_5

    .line 549
    .end local v5    # "ams":Lcom/android/server/am/ActivityManagerService;
    .end local v9    # "i":I
    .end local v18    # "size":I
    .end local v19    # "sizeArr":[I
    .end local v21    # "sizeArrN":I
    :pswitch_2
    const-string v23, "MountService"

    const-string v24, "H_UNMOUNT_MS"

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 550
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v22, v0

    check-cast v22, Lcom/android/server/MountService$UnmountCallBack;

    .line 552
    .restart local v22    # "ucb":Lcom/android/server/MountService$UnmountCallBack;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    const/16 v24, 0x1

    # setter for: Lcom/android/server/MountService;->mNeedRedoUnmount:Z
    invoke-static/range {v23 .. v24}, Lcom/android/server/MountService;->access$1002(Lcom/android/server/MountService;Z)Z

    .line 554
    invoke-virtual/range {v22 .. v22}, Lcom/android/server/MountService$UnmountCallBack;->handleFinished()V

    goto/16 :goto_0

    .line 559
    .end local v22    # "ucb":Lcom/android/server/MountService$UnmountCallBack;
    :pswitch_3
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    # invokes: Lcom/android/server/MountService;->handleSystemReady()V
    invoke-static/range {v23 .. v23}, Lcom/android/server/MountService;->access$1100(Lcom/android/server/MountService;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 560
    :catch_0
    move-exception v8

    .line 561
    .local v8, "ex":Ljava/lang/Exception;
    const-string v23, "MountService"

    const-string v24, "Boot-time mount exception"

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-static {v0, v1, v8}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .line 461
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
