.class Lcom/android/server/job/JobServiceContext$JobServiceHandler;
.super Landroid/os/Handler;
.source "JobServiceContext.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/job/JobServiceContext;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "JobServiceHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/job/JobServiceContext;


# direct methods
.method constructor <init>(Lcom/android/server/job/JobServiceContext;Landroid/os/Looper;)V
    .locals 0
    .param p2, "looper"    # Landroid/os/Looper;

    .prologue
    .line 297
    iput-object p1, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    .line 298
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 299
    return-void
.end method

.method private closeAndCleanupJobH(Z)V
    .locals 5
    .param p1, "reschedule"    # Z

    .prologue
    const/4 v4, 0x1

    .line 527
    iget-object v1, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # getter for: Lcom/android/server/job/JobServiceContext;->mRunningJob:Lcom/android/server/job/controllers/JobStatus;
    invoke-static {v1}, Lcom/android/server/job/JobServiceContext;->access$100(Lcom/android/server/job/JobServiceContext;)Lcom/android/server/job/controllers/JobStatus;

    move-result-object v0

    .line 528
    .local v0, "completedJob":Lcom/android/server/job/controllers/JobStatus;
    iget-object v1, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # getter for: Lcom/android/server/job/JobServiceContext;->mLock:Ljava/lang/Object;
    invoke-static {v1}, Lcom/android/server/job/JobServiceContext;->access$600(Lcom/android/server/job/JobServiceContext;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    .line 536
    :try_start_0
    iget-object v1, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # getter for: Lcom/android/server/job/JobServiceContext;->mWakeLock:Landroid/os/PowerManager$WakeLock;
    invoke-static {v1}, Lcom/android/server/job/JobServiceContext;->access$700(Lcom/android/server/job/JobServiceContext;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 537
    iget-object v1, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # getter for: Lcom/android/server/job/JobServiceContext;->mWakeLock:Landroid/os/PowerManager$WakeLock;
    invoke-static {v1}, Lcom/android/server/job/JobServiceContext;->access$700(Lcom/android/server/job/JobServiceContext;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 539
    :cond_0
    iget-object v1, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # getter for: Lcom/android/server/job/JobServiceContext;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/android/server/job/JobServiceContext;->access$800(Lcom/android/server/job/JobServiceContext;)Landroid/content/Context;

    move-result-object v1

    iget-object v3, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    invoke-virtual {v1, v3}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 540
    iget-object v1, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    const/4 v3, 0x0

    # setter for: Lcom/android/server/job/JobServiceContext;->mWakeLock:Landroid/os/PowerManager$WakeLock;
    invoke-static {v1, v3}, Lcom/android/server/job/JobServiceContext;->access$702(Lcom/android/server/job/JobServiceContext;Landroid/os/PowerManager$WakeLock;)Landroid/os/PowerManager$WakeLock;

    .line 541
    iget-object v1, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    const/4 v3, 0x0

    # setter for: Lcom/android/server/job/JobServiceContext;->mRunningJob:Lcom/android/server/job/controllers/JobStatus;
    invoke-static {v1, v3}, Lcom/android/server/job/JobServiceContext;->access$102(Lcom/android/server/job/JobServiceContext;Lcom/android/server/job/controllers/JobStatus;)Lcom/android/server/job/controllers/JobStatus;

    .line 542
    iget-object v1, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    const/4 v3, 0x0

    # setter for: Lcom/android/server/job/JobServiceContext;->mParams:Landroid/app/job/JobParameters;
    invoke-static {v1, v3}, Lcom/android/server/job/JobServiceContext;->access$502(Lcom/android/server/job/JobServiceContext;Landroid/app/job/JobParameters;)Landroid/app/job/JobParameters;

    .line 543
    iget-object v1, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    const/4 v3, -0x1

    iput v3, v1, Lcom/android/server/job/JobServiceContext;->mVerb:I

    .line 544
    iget-object v1, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # getter for: Lcom/android/server/job/JobServiceContext;->mCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;
    invoke-static {v1}, Lcom/android/server/job/JobServiceContext;->access$300(Lcom/android/server/job/JobServiceContext;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v1

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 545
    iget-object v1, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    const/4 v3, 0x0

    iput-object v3, v1, Lcom/android/server/job/JobServiceContext;->service:Landroid/app/job/IJobService;

    .line 546
    iget-object v1, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    const/4 v3, 0x1

    # setter for: Lcom/android/server/job/JobServiceContext;->mAvailable:Z
    invoke-static {v1, v3}, Lcom/android/server/job/JobServiceContext;->access$902(Lcom/android/server/job/JobServiceContext;Z)Z

    .line 547
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 548
    iget-object v1, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # invokes: Lcom/android/server/job/JobServiceContext;->removeOpTimeOut()V
    invoke-static {v1}, Lcom/android/server/job/JobServiceContext;->access$000(Lcom/android/server/job/JobServiceContext;)V

    .line 549
    invoke-virtual {p0, v4}, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->removeMessages(I)V

    .line 550
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->removeMessages(I)V

    .line 551
    const/4 v1, 0x3

    invoke-virtual {p0, v1}, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->removeMessages(I)V

    .line 552
    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->removeMessages(I)V

    .line 553
    iget-object v1, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # getter for: Lcom/android/server/job/JobServiceContext;->mCompletedListener:Lcom/android/server/job/JobCompletedListener;
    invoke-static {v1}, Lcom/android/server/job/JobServiceContext;->access$1000(Lcom/android/server/job/JobServiceContext;)Lcom/android/server/job/JobCompletedListener;

    move-result-object v1

    invoke-interface {v1, v0, p1}, Lcom/android/server/job/JobCompletedListener;->onJobCompleted(Lcom/android/server/job/controllers/JobStatus;Z)V

    .line 554
    return-void

    .line 547
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private handleCancelH()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 433
    iget-object v0, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # getter for: Lcom/android/server/job/JobServiceContext;->mRunningJob:Lcom/android/server/job/controllers/JobStatus;
    invoke-static {v0}, Lcom/android/server/job/JobServiceContext;->access$100(Lcom/android/server/job/JobServiceContext;)Lcom/android/server/job/controllers/JobStatus;

    move-result-object v0

    if-nez v0, :cond_1

    .line 435
    const-string v0, "JobServiceContext"

    const-string v1, "Trying to process cancel for torn-down context, ignoring."

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 462
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 440
    :cond_1
    const-string v0, "JobServiceContext"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Handling cancel for: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # getter for: Lcom/android/server/job/JobServiceContext;->mRunningJob:Lcom/android/server/job/controllers/JobStatus;
    invoke-static {v2}, Lcom/android/server/job/JobServiceContext;->access$100(Lcom/android/server/job/JobServiceContext;)Lcom/android/server/job/controllers/JobStatus;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/job/controllers/JobStatus;->getJobId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    # getter for: Lcom/android/server/job/JobServiceContext;->VERB_STRINGS:[Ljava/lang/String;
    invoke-static {}, Lcom/android/server/job/JobServiceContext;->access$200()[Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    iget v3, v3, Lcom/android/server/job/JobServiceContext;->mVerb:I

    aget-object v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 443
    iget-object v0, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    iget v0, v0, Lcom/android/server/job/JobServiceContext;->mVerb:I

    packed-switch v0, :pswitch_data_0

    .line 459
    const-string v0, "JobServiceContext"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cancelling a job without a valid verb: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    iget v2, v2, Lcom/android/server/job/JobServiceContext;->mVerb:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 446
    :pswitch_1
    iget-object v0, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # getter for: Lcom/android/server/job/JobServiceContext;->mCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;
    invoke-static {v0}, Lcom/android/server/job/JobServiceContext;->access$300(Lcom/android/server/job/JobServiceContext;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    goto :goto_0

    .line 449
    :pswitch_2
    invoke-virtual {p0, v4}, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->hasMessages(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 453
    invoke-direct {p0}, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->sendStopMessageH()V

    goto :goto_0

    .line 443
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method private handleFinishedH(Z)V
    .locals 4
    .param p1, "reschedule"    # Z

    .prologue
    .line 411
    iget-object v0, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    iget v0, v0, Lcom/android/server/job/JobServiceContext;->mVerb:I

    packed-switch v0, :pswitch_data_0

    .line 417
    const-string v0, "JobServiceContext"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Got an execution complete message for a job that wasn\'t beingexecuted. Was "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    # getter for: Lcom/android/server/job/JobServiceContext;->VERB_STRINGS:[Ljava/lang/String;
    invoke-static {}, Lcom/android/server/job/JobServiceContext;->access$200()[Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    iget v3, v3, Lcom/android/server/job/JobServiceContext;->mVerb:I

    aget-object v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 420
    :goto_0
    return-void

    .line 414
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->closeAndCleanupJobH(Z)V

    goto :goto_0

    .line 411
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private handleOpTimeoutH()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 466
    iget-object v0, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    iget v0, v0, Lcom/android/server/job/JobServiceContext;->mVerb:I

    packed-switch v0, :pswitch_data_0

    .line 493
    const-string v0, "JobServiceContext"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Handling timeout for an invalid job state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # getter for: Lcom/android/server/job/JobServiceContext;->mRunningJob:Lcom/android/server/job/controllers/JobStatus;
    invoke-static {v2}, Lcom/android/server/job/JobServiceContext;->access$100(Lcom/android/server/job/JobServiceContext;)Lcom/android/server/job/controllers/JobStatus;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/job/controllers/JobStatus;->toShortString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", dropping."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 495
    invoke-direct {p0, v3}, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->closeAndCleanupJobH(Z)V

    .line 497
    :goto_0
    return-void

    .line 468
    :pswitch_0
    const-string v0, "JobServiceContext"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Time-out while trying to bind "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # getter for: Lcom/android/server/job/JobServiceContext;->mRunningJob:Lcom/android/server/job/controllers/JobStatus;
    invoke-static {v2}, Lcom/android/server/job/JobServiceContext;->access$100(Lcom/android/server/job/JobServiceContext;)Lcom/android/server/job/controllers/JobStatus;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/job/controllers/JobStatus;->toShortString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", dropping."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 470
    invoke-direct {p0, v3}, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->closeAndCleanupJobH(Z)V

    goto :goto_0

    .line 476
    :pswitch_1
    const-string v0, "JobServiceContext"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No response from client for onStartJob \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # getter for: Lcom/android/server/job/JobServiceContext;->mRunningJob:Lcom/android/server/job/controllers/JobStatus;
    invoke-static {v2}, Lcom/android/server/job/JobServiceContext;->access$100(Lcom/android/server/job/JobServiceContext;)Lcom/android/server/job/controllers/JobStatus;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/job/controllers/JobStatus;->toShortString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 478
    invoke-direct {p0, v3}, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->closeAndCleanupJobH(Z)V

    goto :goto_0

    .line 482
    :pswitch_2
    const-string v0, "JobServiceContext"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No response from client for onStopJob, \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # getter for: Lcom/android/server/job/JobServiceContext;->mRunningJob:Lcom/android/server/job/controllers/JobStatus;
    invoke-static {v2}, Lcom/android/server/job/JobServiceContext;->access$100(Lcom/android/server/job/JobServiceContext;)Lcom/android/server/job/controllers/JobStatus;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/job/controllers/JobStatus;->toShortString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 484
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->closeAndCleanupJobH(Z)V

    goto :goto_0

    .line 488
    :pswitch_3
    const-string v0, "JobServiceContext"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Client timed out while executing (no jobFinished received). sending onStop. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # getter for: Lcom/android/server/job/JobServiceContext;->mRunningJob:Lcom/android/server/job/controllers/JobStatus;
    invoke-static {v2}, Lcom/android/server/job/JobServiceContext;->access$100(Lcom/android/server/job/JobServiceContext;)Lcom/android/server/job/controllers/JobStatus;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/job/controllers/JobStatus;->toShortString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 490
    invoke-direct {p0}, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->sendStopMessageH()V

    goto/16 :goto_0

    .line 466
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method private handleServiceBoundH()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 345
    const-string v1, "JobServiceContext"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "MSG_SERVICE_BOUND for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # getter for: Lcom/android/server/job/JobServiceContext;->mRunningJob:Lcom/android/server/job/controllers/JobStatus;
    invoke-static {v3}, Lcom/android/server/job/JobServiceContext;->access$100(Lcom/android/server/job/JobServiceContext;)Lcom/android/server/job/controllers/JobStatus;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/server/job/controllers/JobStatus;->toShortString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 347
    iget-object v1, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    iget v1, v1, Lcom/android/server/job/JobServiceContext;->mVerb:I

    if-eqz v1, :cond_0

    .line 348
    const-string v1, "JobServiceContext"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Sending onStartJob for a job that isn\'t pending. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    # getter for: Lcom/android/server/job/JobServiceContext;->VERB_STRINGS:[Ljava/lang/String;
    invoke-static {}, Lcom/android/server/job/JobServiceContext;->access$200()[Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    iget v4, v4, Lcom/android/server/job/JobServiceContext;->mVerb:I

    aget-object v3, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 350
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->closeAndCleanupJobH(Z)V

    .line 369
    :goto_0
    return-void

    .line 353
    :cond_0
    iget-object v1, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # getter for: Lcom/android/server/job/JobServiceContext;->mCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;
    invoke-static {v1}, Lcom/android/server/job/JobServiceContext;->access$300(Lcom/android/server/job/JobServiceContext;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 355
    const-string v1, "JobServiceContext"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Job cancelled while waiting for bind to complete. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # getter for: Lcom/android/server/job/JobServiceContext;->mRunningJob:Lcom/android/server/job/controllers/JobStatus;
    invoke-static {v3}, Lcom/android/server/job/JobServiceContext;->access$100(Lcom/android/server/job/JobServiceContext;)Lcom/android/server/job/controllers/JobStatus;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 358
    invoke-direct {p0, v4}, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->closeAndCleanupJobH(Z)V

    goto :goto_0

    .line 362
    :cond_1
    :try_start_0
    iget-object v1, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    const/4 v2, 0x1

    iput v2, v1, Lcom/android/server/job/JobServiceContext;->mVerb:I

    .line 363
    iget-object v1, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # invokes: Lcom/android/server/job/JobServiceContext;->scheduleOpTimeOut()V
    invoke-static {v1}, Lcom/android/server/job/JobServiceContext;->access$400(Lcom/android/server/job/JobServiceContext;)V

    .line 364
    iget-object v1, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    iget-object v1, v1, Lcom/android/server/job/JobServiceContext;->service:Landroid/app/job/IJobService;

    iget-object v2, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # getter for: Lcom/android/server/job/JobServiceContext;->mParams:Landroid/app/job/JobParameters;
    invoke-static {v2}, Lcom/android/server/job/JobServiceContext;->access$500(Lcom/android/server/job/JobServiceContext;)Landroid/app/job/JobParameters;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/app/job/IJobService;->startJob(Landroid/app/job/JobParameters;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 365
    :catch_0
    move-exception v0

    .line 366
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "JobServiceContext"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error sending onStart message to \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # getter for: Lcom/android/server/job/JobServiceContext;->mRunningJob:Lcom/android/server/job/controllers/JobStatus;
    invoke-static {v3}, Lcom/android/server/job/JobServiceContext;->access$100(Lcom/android/server/job/JobServiceContext;)Lcom/android/server/job/controllers/JobStatus;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/server/job/controllers/JobStatus;->getServiceComponent()Landroid/content/ComponentName;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/ComponentName;->getShortClassName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private handleStartedH(Z)V
    .locals 4
    .param p1, "workOngoing"    # Z

    .prologue
    .line 379
    iget-object v0, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    iget v0, v0, Lcom/android/server/job/JobServiceContext;->mVerb:I

    packed-switch v0, :pswitch_data_0

    .line 398
    const-string v0, "JobServiceContext"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Handling started job but job wasn\'t starting! Was "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    # getter for: Lcom/android/server/job/JobServiceContext;->VERB_STRINGS:[Ljava/lang/String;
    invoke-static {}, Lcom/android/server/job/JobServiceContext;->access$200()[Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    iget v3, v3, Lcom/android/server/job/JobServiceContext;->mVerb:I

    aget-object v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 402
    :goto_0
    return-void

    .line 381
    :pswitch_0
    iget-object v0, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    const/4 v1, 0x2

    iput v1, v0, Lcom/android/server/job/JobServiceContext;->mVerb:I

    .line 382
    if-nez p1, :cond_0

    .line 384
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->handleFinishedH(Z)V

    goto :goto_0

    .line 387
    :cond_0
    iget-object v0, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # getter for: Lcom/android/server/job/JobServiceContext;->mCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;
    invoke-static {v0}, Lcom/android/server/job/JobServiceContext;->access$300(Lcom/android/server/job/JobServiceContext;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 389
    const-string v0, "JobServiceContext"

    const-string v1, "Job cancelled while waiting for onStartJob to complete."

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 392
    invoke-direct {p0}, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->handleCancelH()V

    goto :goto_0

    .line 395
    :cond_1
    iget-object v0, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # invokes: Lcom/android/server/job/JobServiceContext;->scheduleOpTimeOut()V
    invoke-static {v0}, Lcom/android/server/job/JobServiceContext;->access$400(Lcom/android/server/job/JobServiceContext;)V

    goto :goto_0

    .line 379
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method private sendStopMessageH()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 504
    iget-object v1, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # invokes: Lcom/android/server/job/JobServiceContext;->removeOpTimeOut()V
    invoke-static {v1}, Lcom/android/server/job/JobServiceContext;->access$000(Lcom/android/server/job/JobServiceContext;)V

    .line 505
    iget-object v1, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    iget v1, v1, Lcom/android/server/job/JobServiceContext;->mVerb:I

    const/4 v2, 0x2

    if-eq v1, v2, :cond_0

    .line 506
    const-string v1, "JobServiceContext"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Sending onStopJob for a job that isn\'t started. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # getter for: Lcom/android/server/job/JobServiceContext;->mRunningJob:Lcom/android/server/job/controllers/JobStatus;
    invoke-static {v3}, Lcom/android/server/job/JobServiceContext;->access$100(Lcom/android/server/job/JobServiceContext;)Lcom/android/server/job/controllers/JobStatus;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 507
    invoke-direct {p0, v4}, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->closeAndCleanupJobH(Z)V

    .line 518
    :goto_0
    return-void

    .line 511
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    const/4 v2, 0x3

    iput v2, v1, Lcom/android/server/job/JobServiceContext;->mVerb:I

    .line 512
    iget-object v1, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # invokes: Lcom/android/server/job/JobServiceContext;->scheduleOpTimeOut()V
    invoke-static {v1}, Lcom/android/server/job/JobServiceContext;->access$400(Lcom/android/server/job/JobServiceContext;)V

    .line 513
    iget-object v1, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    iget-object v1, v1, Lcom/android/server/job/JobServiceContext;->service:Landroid/app/job/IJobService;

    iget-object v2, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # getter for: Lcom/android/server/job/JobServiceContext;->mParams:Landroid/app/job/JobParameters;
    invoke-static {v2}, Lcom/android/server/job/JobServiceContext;->access$500(Lcom/android/server/job/JobServiceContext;)Landroid/app/job/JobParameters;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/app/job/IJobService;->stopJob(Landroid/app/job/JobParameters;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 514
    :catch_0
    move-exception v0

    .line 515
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "JobServiceContext"

    const-string v2, "Error sending onStopJob to client."

    invoke-static {v1, v2, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 516
    invoke-direct {p0, v4}, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->closeAndCleanupJobH(Z)V

    goto :goto_0
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7
    .param p1, "message"    # Landroid/os/Message;

    .prologue
    const/4 v3, 0x0

    const/4 v1, 0x1

    .line 303
    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_0

    .line 338
    const-string v2, "JobServiceContext"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unrecognised message: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 340
    :goto_0
    return-void

    .line 305
    :pswitch_0
    iget-object v2, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # invokes: Lcom/android/server/job/JobServiceContext;->removeOpTimeOut()V
    invoke-static {v2}, Lcom/android/server/job/JobServiceContext;->access$000(Lcom/android/server/job/JobServiceContext;)V

    .line 306
    invoke-direct {p0}, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->handleServiceBoundH()V

    goto :goto_0

    .line 310
    :pswitch_1
    const-string v4, "JobServiceContext"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "MSG_CALLBACK of : "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v5, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # getter for: Lcom/android/server/job/JobServiceContext;->mRunningJob:Lcom/android/server/job/controllers/JobStatus;
    invoke-static {v5}, Lcom/android/server/job/JobServiceContext;->access$100(Lcom/android/server/job/JobServiceContext;)Lcom/android/server/job/controllers/JobStatus;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, " v:"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v2, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    iget v2, v2, Lcom/android/server/job/JobServiceContext;->mVerb:I

    if-ltz v2, :cond_0

    # getter for: Lcom/android/server/job/JobServiceContext;->VERB_STRINGS:[Ljava/lang/String;
    invoke-static {}, Lcom/android/server/job/JobServiceContext;->access$200()[Ljava/lang/String;

    move-result-object v2

    iget-object v6, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    iget v6, v6, Lcom/android/server/job/JobServiceContext;->mVerb:I

    aget-object v2, v2, v6

    :goto_1
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 313
    iget-object v2, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # invokes: Lcom/android/server/job/JobServiceContext;->removeOpTimeOut()V
    invoke-static {v2}, Lcom/android/server/job/JobServiceContext;->access$000(Lcom/android/server/job/JobServiceContext;)V

    .line 315
    iget-object v2, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    iget v2, v2, Lcom/android/server/job/JobServiceContext;->mVerb:I

    if-ne v2, v1, :cond_2

    .line 316
    iget v2, p1, Landroid/os/Message;->arg2:I

    if-ne v2, v1, :cond_1

    .line 317
    .local v1, "workOngoing":Z
    :goto_2
    invoke-direct {p0, v1}, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->handleStartedH(Z)V

    goto :goto_0

    .line 310
    .end local v1    # "workOngoing":Z
    :cond_0
    const-string v2, "[invalid]"

    goto :goto_1

    :cond_1
    move v1, v3

    .line 316
    goto :goto_2

    .line 318
    :cond_2
    iget-object v2, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    iget v2, v2, Lcom/android/server/job/JobServiceContext;->mVerb:I

    const/4 v4, 0x2

    if-eq v2, v4, :cond_3

    iget-object v2, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    iget v2, v2, Lcom/android/server/job/JobServiceContext;->mVerb:I

    const/4 v4, 0x3

    if-ne v2, v4, :cond_5

    .line 320
    :cond_3
    iget v2, p1, Landroid/os/Message;->arg2:I

    if-ne v2, v1, :cond_4

    move v0, v1

    .line 321
    .local v0, "reschedule":Z
    :goto_3
    invoke-direct {p0, v0}, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->handleFinishedH(Z)V

    goto :goto_0

    .end local v0    # "reschedule":Z
    :cond_4
    move v0, v3

    .line 320
    goto :goto_3

    .line 324
    :cond_5
    const-string v2, "JobServiceContext"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unrecognised callback: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->this$0:Lcom/android/server/job/JobServiceContext;

    # getter for: Lcom/android/server/job/JobServiceContext;->mRunningJob:Lcom/android/server/job/controllers/JobStatus;
    invoke-static {v4}, Lcom/android/server/job/JobServiceContext;->access$100(Lcom/android/server/job/JobServiceContext;)Lcom/android/server/job/controllers/JobStatus;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 329
    :pswitch_2
    invoke-direct {p0}, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->handleCancelH()V

    goto/16 :goto_0

    .line 332
    :pswitch_3
    invoke-direct {p0}, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->handleOpTimeoutH()V

    goto/16 :goto_0

    .line 335
    :pswitch_4
    invoke-direct {p0, v1}, Lcom/android/server/job/JobServiceContext$JobServiceHandler;->closeAndCleanupJobH(Z)V

    goto/16 :goto_0

    .line 303
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_4
    .end packed-switch
.end method
