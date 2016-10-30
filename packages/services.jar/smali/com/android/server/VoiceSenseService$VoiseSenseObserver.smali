.class Lcom/android/server/VoiceSenseService$VoiseSenseObserver;
.super Landroid/os/UEventObserver;
.source "VoiceSenseService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/VoiceSenseService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "VoiseSenseObserver"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/VoiceSenseService$VoiseSenseObserver$BootCompletedReceiver;
    }
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mFullWakeLock:Landroid/os/PowerManager$WakeLock;

.field final synthetic this$0:Lcom/android/server/VoiceSenseService;

.field private final voiceSenseUevent:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/android/server/VoiceSenseService;Landroid/content/Context;)V
    .locals 5
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    .line 333
    iput-object p1, p0, Lcom/android/server/VoiceSenseService$VoiseSenseObserver;->this$0:Lcom/android/server/VoiceSenseService;

    invoke-direct {p0}, Landroid/os/UEventObserver;-><init>()V

    .line 328
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "OF_NAME=es325_codec_gen0"

    aput-object v3, v1, v2

    iput-object v1, p0, Lcom/android/server/VoiceSenseService$VoiseSenseObserver;->voiceSenseUevent:[Ljava/lang/String;

    .line 334
    iput-object p2, p0, Lcom/android/server/VoiceSenseService$VoiseSenseObserver;->mContext:Landroid/content/Context;

    .line 335
    const-string v1, "power"

    invoke-virtual {p2, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    .line 336
    .local v0, "pm":Landroid/os/PowerManager;
    const v1, 0x3000001a

    const-string v2, "VSObserverFullWL"

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    iput-object v1, p0, Lcom/android/server/VoiceSenseService$VoiseSenseObserver;->mFullWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 340
    new-instance v1, Lcom/android/server/VoiceSenseService$VoiseSenseObserver$BootCompletedReceiver;

    invoke-direct {v1, p0, v4}, Lcom/android/server/VoiceSenseService$VoiseSenseObserver$BootCompletedReceiver;-><init>(Lcom/android/server/VoiceSenseService$VoiseSenseObserver;Lcom/android/server/VoiceSenseService$1;)V

    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.BOOT_COMPLETED"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v1, v2, v4, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 342
    return-void
.end method

.method static synthetic access$700(Lcom/android/server/VoiceSenseService$VoiseSenseObserver;)[Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/VoiceSenseService$VoiseSenseObserver;

    .prologue
    .line 315
    iget-object v0, p0, Lcom/android/server/VoiceSenseService$VoiseSenseObserver;->voiceSenseUevent:[Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public onUEvent(Landroid/os/UEventObserver$UEvent;)V
    .locals 6
    .param p1, "event"    # Landroid/os/UEventObserver$UEvent;

    .prologue
    .line 355
    const-string v3, "VoiceSense-Service"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "### VoiceSense UEvent: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Landroid/os/UEventObserver$UEvent;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ###"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 358
    const-string v3, "sys.property.isKidsmode"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 359
    .local v2, "kidMode":Ljava/lang/String;
    const-string v3, "1"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 360
    const-string v0, "VoiceSenseUevent"

    .line 361
    .local v0, "CUSTOM_INTENT":Ljava/lang/String;
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 362
    .local v1, "i":Landroid/content/Intent;
    const-string v3, "VoiceSenseUevent"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 363
    iget-object v3, p0, Lcom/android/server/VoiceSenseService$VoiseSenseObserver;->mContext:Landroid/content/Context;

    invoke-virtual {v3, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 365
    .end local v0    # "CUSTOM_INTENT":Ljava/lang/String;
    .end local v1    # "i":Landroid/content/Intent;
    :cond_0
    return-void
.end method
