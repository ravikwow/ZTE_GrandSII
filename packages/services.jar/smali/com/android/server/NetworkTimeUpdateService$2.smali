.class Lcom/android/server/NetworkTimeUpdateService$2;
.super Landroid/content/BroadcastReceiver;
.source "NetworkTimeUpdateService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/NetworkTimeUpdateService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/NetworkTimeUpdateService;


# direct methods
.method constructor <init>(Lcom/android/server/NetworkTimeUpdateService;)V
    .locals 0

    .prologue
    .line 241
    iput-object p1, p0, Lcom/android/server/NetworkTimeUpdateService$2;->this$0:Lcom/android/server/NetworkTimeUpdateService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 245
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 246
    .local v0, "action":Ljava/lang/String;
    const-string v1, "NetworkTimeUpdateService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onReceive:Nitz intent:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 247
    const-string v1, "android.intent.action.NETWORK_SET_TIME"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 248
    iget-object v1, p0, Lcom/android/server/NetworkTimeUpdateService$2;->this$0:Lcom/android/server/NetworkTimeUpdateService;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    # setter for: Lcom/android/server/NetworkTimeUpdateService;->mNitzTimeSetTime:J
    invoke-static {v1, v2, v3}, Lcom/android/server/NetworkTimeUpdateService;->access$102(Lcom/android/server/NetworkTimeUpdateService;J)J

    .line 252
    :cond_0
    :goto_0
    return-void

    .line 249
    :cond_1
    const-string v1, "android.intent.action.NETWORK_SET_TIMEZONE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 250
    iget-object v1, p0, Lcom/android/server/NetworkTimeUpdateService$2;->this$0:Lcom/android/server/NetworkTimeUpdateService;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    # setter for: Lcom/android/server/NetworkTimeUpdateService;->mNitzZoneSetTime:J
    invoke-static {v1, v2, v3}, Lcom/android/server/NetworkTimeUpdateService;->access$202(Lcom/android/server/NetworkTimeUpdateService;J)J

    goto :goto_0
.end method
