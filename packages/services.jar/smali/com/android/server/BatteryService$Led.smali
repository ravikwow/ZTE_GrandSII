.class final Lcom/android/server/BatteryService$Led;
.super Ljava/lang/Object;
.source "BatteryService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/BatteryService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Led"
.end annotation


# instance fields
.field private final mBatteryFullARGB:I

.field private final mBatteryLedOff:I

.field private final mBatteryLedOn:I

.field private final mBatteryLight:Lcom/android/server/LightsService$Light;

.field private final mBatteryLowARGB:I

.field private final mBatteryMediumARGB:I

.field private final mInnerContext:Landroid/content/Context;

.field final synthetic this$0:Lcom/android/server/BatteryService;


# direct methods
.method public constructor <init>(Lcom/android/server/BatteryService;Landroid/content/Context;Lcom/android/server/LightsService;)V
    .locals 2
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "lights"    # Lcom/android/server/LightsService;

    .prologue
    iput-object p1, p0, Lcom/android/server/BatteryService$Led;->this$0:Lcom/android/server/BatteryService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/android/server/BatteryService$Led;->mInnerContext:Landroid/content/Context;

    const/4 v0, 0x3

    invoke-virtual {p3, v0}, Lcom/android/server/LightsService;->getLight(I)Lcom/android/server/LightsService$Light;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/BatteryService$Led;->mBatteryLight:Lcom/android/server/LightsService$Light;

    .line 730
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x10e0025

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Lcom/android/server/BatteryService$Led;->mBatteryLowARGB:I

    .line 732
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x10e0026

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Lcom/android/server/BatteryService$Led;->mBatteryMediumARGB:I

    .line 734
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x10e0027

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Lcom/android/server/BatteryService$Led;->mBatteryFullARGB:I

    .line 736
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x10e0028

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Lcom/android/server/BatteryService$Led;->mBatteryLedOn:I

    .line 738
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x10e0029

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Lcom/android/server/BatteryService$Led;->mBatteryLedOff:I

    .line 740
    return-void
.end method


# virtual methods
.method public turnOffLight()V
    .locals 1

    .prologue
    .line 807
    iget-object v0, p0, Lcom/android/server/BatteryService$Led;->mBatteryLight:Lcom/android/server/LightsService$Light;

    invoke-virtual {v0}, Lcom/android/server/LightsService$Light;->turnOff()V

    .line 808
    return-void
.end method

.method public updateLightsLocked()V
    .locals 10

    .prologue
    const/4 v5, 0x0

    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x5

    .line 746
    iget-object v4, p0, Lcom/android/server/BatteryService$Led;->this$0:Lcom/android/server/BatteryService;

    # getter for: Lcom/android/server/BatteryService;->mBatteryProps:Landroid/os/BatteryProperties;
    invoke-static {v4}, Lcom/android/server/BatteryService;->access$500(Lcom/android/server/BatteryService;)Landroid/os/BatteryProperties;

    move-result-object v4

    iget v0, v4, Landroid/os/BatteryProperties;->batteryLevel:I

    .line 747
    .local v0, "level":I
    iget-object v4, p0, Lcom/android/server/BatteryService$Led;->this$0:Lcom/android/server/BatteryService;

    # getter for: Lcom/android/server/BatteryService;->mBatteryProps:Landroid/os/BatteryProperties;
    invoke-static {v4}, Lcom/android/server/BatteryService;->access$500(Lcom/android/server/BatteryService;)Landroid/os/BatteryProperties;

    move-result-object v4

    iget v3, v4, Landroid/os/BatteryProperties;->batteryStatus:I

    .line 749
    .local v3, "status":I
    const-string v4, "persist.sys.quickboot"

    invoke-static {v4, v5}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 750
    .local v1, "quickbootVal":I
    const-string v4, "service.quickboot.state"

    invoke-static {v4, v5}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 751
    .local v2, "quickboot_state":I
    # getter for: Lcom/android/server/BatteryService;->TAG:Ljava/lang/String;
    invoke-static {}, Lcom/android/server/BatteryService;->access$600()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "quickbootVal = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", quickboot_state = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 752
    if-ne v1, v8, :cond_5

    if-ne v2, v8, :cond_5

    .line 753
    iget-object v4, p0, Lcom/android/server/BatteryService$Led;->this$0:Lcom/android/server/BatteryService;

    # getter for: Lcom/android/server/BatteryService;->mPlugType:I
    invoke-static {v4}, Lcom/android/server/BatteryService;->access$700(Lcom/android/server/BatteryService;)I

    move-result v4

    if-eqz v4, :cond_4

    .line 754
    const-string v4, "chargerQuickboot"

    invoke-static {v4}, Landroid/os/SystemService;->isRunning(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 755
    const-string v4, "chargerQuickboot"

    invoke-static {v4}, Landroid/os/SystemService;->start(Ljava/lang/String;)V

    .line 756
    # getter for: Lcom/android/server/BatteryService;->TAG:Ljava/lang/String;
    invoke-static {}, Lcom/android/server/BatteryService;->access$600()Ljava/lang/String;

    move-result-object v4

    const-string v5, "quickboot start chargerQuickboot."

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    if-eq v3, v9, :cond_0

    if-ne v3, v7, :cond_1

    :cond_0
    if-ne v3, v7, :cond_3

    iget-object v4, p0, Lcom/android/server/BatteryService$Led;->mBatteryLight:Lcom/android/server/LightsService$Light;

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/android/server/BatteryService$Led;->mInnerContext:Landroid/content/Context;

    invoke-static {v2, v1}, Landroid/juelian/JuelianUtils;->getBatteryColor(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/android/server/LightsService$Light;->setColor(I)V

    :cond_1
    :goto_1
    return-void

    :cond_2
    # getter for: Lcom/android/server/BatteryService;->TAG:Ljava/lang/String;
    invoke-static {}, Lcom/android/server/BatteryService;->access$600()Ljava/lang/String;

    move-result-object v4

    const-string v5, "quickboot chargerQuickboot is running!"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 768
    :cond_3
    iget-object v4, p0, Lcom/android/server/BatteryService$Led;->mBatteryLight:Lcom/android/server/LightsService$Light;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/android/server/BatteryService$Led;->mInnerContext:Landroid/content/Context;

    invoke-static {v2, v1}, Landroid/juelian/JuelianUtils;->getBatteryColor(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/android/server/LightsService$Light;->setColor(I)V

    goto :goto_1

    .line 774
    :cond_4
    iget-object v4, p0, Lcom/android/server/BatteryService$Led;->mBatteryLight:Lcom/android/server/LightsService$Light;

    invoke-virtual {v4}, Lcom/android/server/LightsService$Light;->turnOff()V

    .line 775
    # getter for: Lcom/android/server/BatteryService;->TAG:Ljava/lang/String;
    invoke-static {}, Lcom/android/server/BatteryService;->access$600()Ljava/lang/String;

    move-result-object v4

    const-string v5, "quickboot BATTERY_PLUGGED_NONE!"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 781
    :cond_5
    iget-object v4, p0, Lcom/android/server/BatteryService$Led;->this$0:Lcom/android/server/BatteryService;

    # getter for: Lcom/android/server/BatteryService;->mLowBatteryWarningLevel:I
    invoke-static {v4}, Lcom/android/server/BatteryService;->access$800(Lcom/android/server/BatteryService;)I

    move-result v4

    if-ge v0, v4, :cond_7

    .line 782
    if-ne v3, v9, :cond_6

    .line 784
    iget-object v4, p0, Lcom/android/server/BatteryService$Led;->mBatteryLight:Lcom/android/server/LightsService$Light;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/android/server/BatteryService$Led;->mInnerContext:Landroid/content/Context;

    invoke-static {v2, v1}, Landroid/juelian/JuelianUtils;->getBatteryColor(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/android/server/LightsService$Light;->setColor(I)V

    goto :goto_1

    .line 787
    :cond_6
    iget-object v4, p0, Lcom/android/server/BatteryService$Led;->mBatteryLight:Lcom/android/server/LightsService$Light;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/android/server/BatteryService$Led;->mInnerContext:Landroid/content/Context;

    invoke-static {v2, v1}, Landroid/juelian/JuelianUtils;->getBatteryColor(Landroid/content/Context;I)I

    move-result v5

    iget v6, p0, Lcom/android/server/BatteryService$Led;->mBatteryLedOn:I

    iget v7, p0, Lcom/android/server/BatteryService$Led;->mBatteryLedOff:I

    invoke-virtual {v4, v5, v8, v6, v7}, Lcom/android/server/LightsService$Light;->setFlashing(IIII)V

    goto :goto_1

    .line 790
    :cond_7
    if-eq v3, v9, :cond_8

    if-ne v3, v7, :cond_a

    .line 792
    :cond_8
    if-ne v3, v7, :cond_9

    .line 794
    iget-object v4, p0, Lcom/android/server/BatteryService$Led;->mBatteryLight:Lcom/android/server/LightsService$Light;

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/android/server/BatteryService$Led;->mInnerContext:Landroid/content/Context;

    invoke-static {v2, v1}, Landroid/juelian/JuelianUtils;->getBatteryColor(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/android/server/LightsService$Light;->setColor(I)V

    goto :goto_1

    .line 797
    :cond_9
    iget-object v4, p0, Lcom/android/server/BatteryService$Led;->mBatteryLight:Lcom/android/server/LightsService$Light;

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/android/server/BatteryService$Led;->mInnerContext:Landroid/content/Context;

    invoke-static {v2, v1}, Landroid/juelian/JuelianUtils;->getBatteryColor(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/android/server/LightsService$Light;->setColor(I)V

    goto :goto_1

    .line 801
    :cond_a
    iget-object v4, p0, Lcom/android/server/BatteryService$Led;->mBatteryLight:Lcom/android/server/LightsService$Light;

    invoke-virtual {v4}, Lcom/android/server/LightsService$Light;->turnOff()V

    goto :goto_1
.end method
