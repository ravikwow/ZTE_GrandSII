.class public Lcom/android/server/BatteryService$ShutDownZeroChargerConnect;
.super Ljava/lang/Object;
.source "BatteryService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/BatteryService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ShutDownZeroChargerConnect"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/BatteryService;


# direct methods
.method public constructor <init>(Lcom/android/server/BatteryService;)V
    .locals 0

    .prologue
    .line 827
    iput-object p1, p0, Lcom/android/server/BatteryService$ShutDownZeroChargerConnect;->this$0:Lcom/android/server/BatteryService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 829
    :goto_0
    iget-object v1, p0, Lcom/android/server/BatteryService$ShutDownZeroChargerConnect;->this$0:Lcom/android/server/BatteryService;

    # getter for: Lcom/android/server/BatteryService;->mBatteryProps:Landroid/os/BatteryProperties;
    invoke-static {v1}, Lcom/android/server/BatteryService;->access$500(Lcom/android/server/BatteryService;)Landroid/os/BatteryProperties;

    move-result-object v1

    iget v1, v1, Landroid/os/BatteryProperties;->batteryLevel:I

    if-nez v1, :cond_1

    .line 833
    :try_start_0
    iget-object v1, p0, Lcom/android/server/BatteryService$ShutDownZeroChargerConnect;->this$0:Lcom/android/server/BatteryService;

    const/4 v2, 0x7

    # invokes: Lcom/android/server/BatteryService;->isPoweredLocked(I)Z
    invoke-static {v1, v2}, Lcom/android/server/BatteryService;->access$900(Lcom/android/server/BatteryService;I)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/server/BatteryService$ShutDownZeroChargerConnect;->this$0:Lcom/android/server/BatteryService;

    # invokes: Lcom/android/server/BatteryService;->isDischarging()Z
    invoke-static {v1}, Lcom/android/server/BatteryService;->access$1000(Lcom/android/server/BatteryService;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 834
    # getter for: Lcom/android/server/BatteryService;->TAG:Ljava/lang/String;
    invoke-static {}, Lcom/android/server/BatteryService;->access$600()Ljava/lang/String;

    move-result-object v1

    const-string v2, "isDischarging is true\n"

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 835
    iget-object v1, p0, Lcom/android/server/BatteryService$ShutDownZeroChargerConnect;->this$0:Lcom/android/server/BatteryService;

    # invokes: Lcom/android/server/BatteryService;->initiateShutdown()V
    invoke-static {v1}, Lcom/android/server/BatteryService;->access$100(Lcom/android/server/BatteryService;)V

    .line 837
    :cond_0
    # getter for: Lcom/android/server/BatteryService;->TAG:Ljava/lang/String;
    invoke-static {}, Lcom/android/server/BatteryService;->access$600()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ShutDownZeroChargerConnect thread running\n"

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 838
    const-wide/16 v1, 0x4e20

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 839
    :catch_0
    move-exception v0

    .line 840
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0

    .line 843
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_1
    const/4 v1, 0x0

    # setter for: Lcom/android/server/BatteryService;->mBatteryLevelZero:Z
    invoke-static {v1}, Lcom/android/server/BatteryService;->access$1102(Z)Z

    .line 844
    # getter for: Lcom/android/server/BatteryService;->TAG:Ljava/lang/String;
    invoke-static {}, Lcom/android/server/BatteryService;->access$600()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ShutDownZeroChargerConnect thread exited:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    # getter for: Lcom/android/server/BatteryService;->mBatteryLevelZero:Z
    invoke-static {}, Lcom/android/server/BatteryService;->access$1100()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 845
    return-void
.end method
