.class Lcom/android/server/PPPOEService$InterfaceObserver;
.super Lcom/android/server/net/BaseNetworkObserver;
.source "PPPOEService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/PPPOEService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InterfaceObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/PPPOEService;


# direct methods
.method constructor <init>(Lcom/android/server/PPPOEService;)V
    .locals 0

    .prologue
    .line 66
    iput-object p1, p0, Lcom/android/server/PPPOEService$InterfaceObserver;->this$0:Lcom/android/server/PPPOEService;

    .line 67
    invoke-direct {p0}, Lcom/android/server/net/BaseNetworkObserver;-><init>()V

    .line 68
    return-void
.end method


# virtual methods
.method public interfaceLinkStateChanged(Ljava/lang/String;Z)V
    .locals 3
    .param p1, "iface"    # Ljava/lang/String;
    .param p2, "up"    # Z

    .prologue
    .line 72
    const-string v0, "ppp"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/PPPOEService$InterfaceObserver;->this$0:Lcom/android/server/PPPOEService;

    # getter for: Lcom/android/server/PPPOEService;->mPppoeStatus:Landroid/net/wifi/PPPOEInfo$Status;
    invoke-static {v0}, Lcom/android/server/PPPOEService;->access$000(Lcom/android/server/PPPOEService;)Landroid/net/wifi/PPPOEInfo$Status;

    move-result-object v0

    sget-object v1, Landroid/net/wifi/PPPOEInfo$Status;->OFFLINE:Landroid/net/wifi/PPPOEInfo$Status;

    if-eq v0, v1, :cond_0

    .line 73
    if-eqz p2, :cond_1

    .line 74
    iget-object v0, p0, Lcom/android/server/PPPOEService$InterfaceObserver;->this$0:Lcom/android/server/PPPOEService;

    # invokes: Lcom/android/server/PPPOEService;->setRouteAndDNS(Ljava/lang/String;)V
    invoke-static {v0, p1}, Lcom/android/server/PPPOEService;->access$100(Lcom/android/server/PPPOEService;Ljava/lang/String;)V

    .line 75
    iget-object v0, p0, Lcom/android/server/PPPOEService$InterfaceObserver;->this$0:Lcom/android/server/PPPOEService;

    sget-object v1, Landroid/net/wifi/PPPOEInfo$Status;->ONLINE:Landroid/net/wifi/PPPOEInfo$Status;

    # setter for: Lcom/android/server/PPPOEService;->mPppoeStatus:Landroid/net/wifi/PPPOEInfo$Status;
    invoke-static {v0, v1}, Lcom/android/server/PPPOEService;->access$002(Lcom/android/server/PPPOEService;Landroid/net/wifi/PPPOEInfo$Status;)Landroid/net/wifi/PPPOEInfo$Status;

    .line 76
    iget-object v0, p0, Lcom/android/server/PPPOEService$InterfaceObserver;->this$0:Lcom/android/server/PPPOEService;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    # setter for: Lcom/android/server/PPPOEService;->mConnectedtime:J
    invoke-static {v0, v1, v2}, Lcom/android/server/PPPOEService;->access$202(Lcom/android/server/PPPOEService;J)J

    .line 77
    iget-object v0, p0, Lcom/android/server/PPPOEService$InterfaceObserver;->this$0:Lcom/android/server/PPPOEService;

    const-string v1, "PPPOE_STATE_CONNECTED"

    # invokes: Lcom/android/server/PPPOEService;->notifyStatusChanged(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/android/server/PPPOEService;->access$300(Lcom/android/server/PPPOEService;Ljava/lang/String;)V

    .line 86
    :cond_0
    :goto_0
    return-void

    .line 79
    :cond_1
    iget-object v0, p0, Lcom/android/server/PPPOEService$InterfaceObserver;->this$0:Lcom/android/server/PPPOEService;

    # getter for: Lcom/android/server/PPPOEService;->mPppoeStatus:Landroid/net/wifi/PPPOEInfo$Status;
    invoke-static {v0}, Lcom/android/server/PPPOEService;->access$000(Lcom/android/server/PPPOEService;)Landroid/net/wifi/PPPOEInfo$Status;

    move-result-object v0

    sget-object v1, Landroid/net/wifi/PPPOEInfo$Status;->ONLINE:Landroid/net/wifi/PPPOEInfo$Status;

    if-ne v0, v1, :cond_0

    .line 80
    iget-object v0, p0, Lcom/android/server/PPPOEService$InterfaceObserver;->this$0:Lcom/android/server/PPPOEService;

    sget-object v1, Landroid/net/wifi/PPPOEInfo$Status;->OFFLINE:Landroid/net/wifi/PPPOEInfo$Status;

    # setter for: Lcom/android/server/PPPOEService;->mPppoeStatus:Landroid/net/wifi/PPPOEInfo$Status;
    invoke-static {v0, v1}, Lcom/android/server/PPPOEService;->access$002(Lcom/android/server/PPPOEService;Landroid/net/wifi/PPPOEInfo$Status;)Landroid/net/wifi/PPPOEInfo$Status;

    .line 81
    iget-object v0, p0, Lcom/android/server/PPPOEService$InterfaceObserver;->this$0:Lcom/android/server/PPPOEService;

    const-wide/16 v1, 0x0

    # setter for: Lcom/android/server/PPPOEService;->mConnectedtime:J
    invoke-static {v0, v1, v2}, Lcom/android/server/PPPOEService;->access$202(Lcom/android/server/PPPOEService;J)J

    .line 82
    iget-object v0, p0, Lcom/android/server/PPPOEService$InterfaceObserver;->this$0:Lcom/android/server/PPPOEService;

    const-string v1, "PPPOE_STATE_DISCONNECTED"

    # invokes: Lcom/android/server/PPPOEService;->notifyStatusChanged(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/android/server/PPPOEService;->access$300(Lcom/android/server/PPPOEService;Ljava/lang/String;)V

    goto :goto_0
.end method
