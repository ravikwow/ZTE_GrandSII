.class final Lcom/android/server/power/PowerManagerService$ScreenOnBlockerImpl;
.super Ljava/lang/Object;
.source "PowerManagerService.java"

# interfaces
.implements Lcom/android/server/power/ScreenOnBlocker;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/power/PowerManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ScreenOnBlockerImpl"
.end annotation


# instance fields
.field private mNestCount:I

.field final synthetic this$0:Lcom/android/server/power/PowerManagerService;


# direct methods
.method private constructor <init>(Lcom/android/server/power/PowerManagerService;)V
    .locals 0

    .prologue
    .line 2990
    iput-object p1, p0, Lcom/android/server/power/PowerManagerService$ScreenOnBlockerImpl;->this$0:Lcom/android/server/power/PowerManagerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/power/PowerManagerService;Lcom/android/server/power/PowerManagerService$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/server/power/PowerManagerService;
    .param p2, "x1"    # Lcom/android/server/power/PowerManagerService$1;

    .prologue
    .line 2990
    invoke-direct {p0, p1}, Lcom/android/server/power/PowerManagerService$ScreenOnBlockerImpl;-><init>(Lcom/android/server/power/PowerManagerService;)V

    return-void
.end method


# virtual methods
.method public acquire()V
    .locals 3

    .prologue
    .line 3001
    monitor-enter p0

    .line 3002
    :try_start_0
    iget v0, p0, Lcom/android/server/power/PowerManagerService$ScreenOnBlockerImpl;->mNestCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/server/power/PowerManagerService$ScreenOnBlockerImpl;->mNestCount:I

    .line 3004
    const-string v0, "PowerManagerService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Screen on blocked: mNestCount="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/server/power/PowerManagerService$ScreenOnBlockerImpl;->mNestCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3006
    monitor-exit p0

    .line 3007
    return-void

    .line 3006
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public isHeld()Z
    .locals 1

    .prologue
    .line 2994
    monitor-enter p0

    .line 2995
    :try_start_0
    iget v0, p0, Lcom/android/server/power/PowerManagerService$ScreenOnBlockerImpl;->mNestCount:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 2996
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public release()V
    .locals 3

    .prologue
    .line 3011
    monitor-enter p0

    .line 3012
    :try_start_0
    iget v0, p0, Lcom/android/server/power/PowerManagerService$ScreenOnBlockerImpl;->mNestCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/android/server/power/PowerManagerService$ScreenOnBlockerImpl;->mNestCount:I

    .line 3013
    iget v0, p0, Lcom/android/server/power/PowerManagerService$ScreenOnBlockerImpl;->mNestCount:I

    if-gez v0, :cond_0

    .line 3014
    const-string v0, "PowerManagerService"

    const-string v1, "Screen on blocker was released without being acquired!"

    new-instance v2, Ljava/lang/Throwable;

    invoke-direct {v2}, Ljava/lang/Throwable;-><init>()V

    invoke-static {v0, v1, v2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 3016
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/server/power/PowerManagerService$ScreenOnBlockerImpl;->mNestCount:I

    .line 3018
    :cond_0
    iget v0, p0, Lcom/android/server/power/PowerManagerService$ScreenOnBlockerImpl;->mNestCount:I

    if-nez v0, :cond_1

    .line 3019
    iget-object v0, p0, Lcom/android/server/power/PowerManagerService$ScreenOnBlockerImpl;->this$0:Lcom/android/server/power/PowerManagerService;

    # getter for: Lcom/android/server/power/PowerManagerService;->mHandler:Lcom/android/server/power/PowerManagerService$PowerManagerHandler;
    invoke-static {v0}, Lcom/android/server/power/PowerManagerService;->access$2700(Lcom/android/server/power/PowerManagerService;)Lcom/android/server/power/PowerManagerService$PowerManagerHandler;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 3022
    :cond_1
    const-string v0, "PowerManagerService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Screen on unblocked: mNestCount="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/server/power/PowerManagerService$ScreenOnBlockerImpl;->mNestCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3024
    monitor-exit p0

    .line 3025
    return-void

    .line 3024
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 3029
    monitor-enter p0

    .line 3030
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "held="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v0, p0, Lcom/android/server/power/PowerManagerService$ScreenOnBlockerImpl;->mNestCount:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mNestCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/power/PowerManagerService$ScreenOnBlockerImpl;->mNestCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    monitor-exit p0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 3031
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
