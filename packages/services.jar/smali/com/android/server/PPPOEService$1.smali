.class Lcom/android/server/PPPOEService$1;
.super Landroid/content/BroadcastReceiver;
.source "PPPOEService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/PPPOEService;-><init>(Landroid/content/Context;Lcom/android/server/wifi/WifiService;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/PPPOEService;


# direct methods
.method constructor <init>(Lcom/android/server/PPPOEService;)V
    .locals 0

    .prologue
    .line 158
    iput-object p1, p0, Lcom/android/server/PPPOEService$1;->this$0:Lcom/android/server/PPPOEService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 161
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 162
    .local v0, "action":Ljava/lang/String;
    const-string v2, "PPPOEService"

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    const-string v2, "android.net.wifi.PPPOE_ALARM_STOP_ACTION"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 164
    iget-object v2, p0, Lcom/android/server/PPPOEService$1;->this$0:Lcom/android/server/PPPOEService;

    # getter for: Lcom/android/server/PPPOEService;->mPppoeStatus:Landroid/net/wifi/PPPOEInfo$Status;
    invoke-static {v2}, Lcom/android/server/PPPOEService;->access$000(Lcom/android/server/PPPOEService;)Landroid/net/wifi/PPPOEInfo$Status;

    move-result-object v2

    sget-object v3, Landroid/net/wifi/PPPOEInfo$Status;->ONLINE:Landroid/net/wifi/PPPOEInfo$Status;

    if-eq v2, v3, :cond_0

    .line 165
    iget-object v2, p0, Lcom/android/server/PPPOEService$1;->this$0:Lcom/android/server/PPPOEService;

    invoke-virtual {v2}, Lcom/android/server/PPPOEService;->stopPPPOE()V

    .line 166
    iget-object v2, p0, Lcom/android/server/PPPOEService$1;->this$0:Lcom/android/server/PPPOEService;

    const-wide/16 v3, 0x0

    # setter for: Lcom/android/server/PPPOEService;->mConnectedtime:J
    invoke-static {v2, v3, v4}, Lcom/android/server/PPPOEService;->access$202(Lcom/android/server/PPPOEService;J)J

    .line 167
    iget-object v2, p0, Lcom/android/server/PPPOEService$1;->this$0:Lcom/android/server/PPPOEService;

    sget-object v3, Landroid/net/wifi/PPPOEInfo$Status;->OFFLINE:Landroid/net/wifi/PPPOEInfo$Status;

    # setter for: Lcom/android/server/PPPOEService;->mPppoeStatus:Landroid/net/wifi/PPPOEInfo$Status;
    invoke-static {v2, v3}, Lcom/android/server/PPPOEService;->access$002(Lcom/android/server/PPPOEService;Landroid/net/wifi/PPPOEInfo$Status;)Landroid/net/wifi/PPPOEInfo$Status;

    .line 168
    iget-object v2, p0, Lcom/android/server/PPPOEService$1;->this$0:Lcom/android/server/PPPOEService;

    const-string v3, "PPPOE_STATE_FAILURE"

    # invokes: Lcom/android/server/PPPOEService;->notifyStatusChanged(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/android/server/PPPOEService;->access$300(Lcom/android/server/PPPOEService;Ljava/lang/String;)V

    .line 185
    :cond_0
    :goto_0
    return-void

    .line 170
    :cond_1
    const-string v2, "android.net.wifi.PPPOE_STATE_CHANGED"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 171
    const-string v2, "pppoe_state"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 172
    .local v1, "errorCode":Ljava/lang/String;
    const-string v2, "PPPOE_STATE_CONNECTED"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 174
    const-string v2, "PPPOE_STATE_DISCONNECTED"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 176
    const-string v2, "PPPOE_STATE_FAILURE"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0
.end method
