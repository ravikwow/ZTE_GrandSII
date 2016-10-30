.class Lcom/android/server/BatteryService$9;
.super Landroid/content/BroadcastReceiver;
.source "BatteryService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/BatteryService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/BatteryService;


# direct methods
.method constructor <init>(Lcom/android/server/BatteryService;)V
    .locals 0

    .prologue
    .line 869
    iput-object p1, p0, Lcom/android/server/BatteryService$9;->this$0:Lcom/android/server/BatteryService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 871
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 872
    .local v0, "action":Ljava/lang/String;
    const-string v1, "zte.com.cn.action.quickshutdown"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 873
    # getter for: Lcom/android/server/BatteryService;->TAG:Ljava/lang/String;
    invoke-static {}, Lcom/android/server/BatteryService;->access$600()Ljava/lang/String;

    move-result-object v1

    const-string v2, "zhq, onReceive intent zte.com.cn.action.quickshutdown"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 874
    iget-object v1, p0, Lcom/android/server/BatteryService$9;->this$0:Lcom/android/server/BatteryService;

    # getter for: Lcom/android/server/BatteryService;->mPlugType:I
    invoke-static {v1}, Lcom/android/server/BatteryService;->access$700(Lcom/android/server/BatteryService;)I

    move-result v1

    if-nez v1, :cond_0

    .line 875
    # getter for: Lcom/android/server/BatteryService;->TAG:Ljava/lang/String;
    invoke-static {}, Lcom/android/server/BatteryService;->access$600()Ljava/lang/String;

    move-result-object v1

    const-string v2, "zhq, onReceive quickshutdown intent and BATTERY_PLUGGED_NONE"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 876
    iget-object v1, p0, Lcom/android/server/BatteryService$9;->this$0:Lcom/android/server/BatteryService;

    # getter for: Lcom/android/server/BatteryService;->mLed:Lcom/android/server/BatteryService$Led;
    invoke-static {v1}, Lcom/android/server/BatteryService;->access$1200(Lcom/android/server/BatteryService;)Lcom/android/server/BatteryService$Led;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/server/BatteryService$Led;->turnOffLight()V

    .line 879
    :cond_0
    return-void
.end method
