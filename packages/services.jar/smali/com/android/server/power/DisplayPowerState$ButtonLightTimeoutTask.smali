.class Lcom/android/server/power/DisplayPowerState$ButtonLightTimeoutTask;
.super Ljava/lang/Object;
.source "DisplayPowerState.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/power/DisplayPowerState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ButtonLightTimeoutTask"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/power/DisplayPowerState;


# direct methods
.method private constructor <init>(Lcom/android/server/power/DisplayPowerState;)V
    .locals 0

    .prologue
    .line 149
    iput-object p1, p0, Lcom/android/server/power/DisplayPowerState$ButtonLightTimeoutTask;->this$0:Lcom/android/server/power/DisplayPowerState;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/power/DisplayPowerState;Lcom/android/server/power/DisplayPowerState$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/server/power/DisplayPowerState;
    .param p2, "x1"    # Lcom/android/server/power/DisplayPowerState$1;

    .prologue
    .line 149
    invoke-direct {p0, p1}, Lcom/android/server/power/DisplayPowerState$ButtonLightTimeoutTask;-><init>(Lcom/android/server/power/DisplayPowerState;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 152
    iget-object v0, p0, Lcom/android/server/power/DisplayPowerState$ButtonLightTimeoutTask;->this$0:Lcom/android/server/power/DisplayPowerState;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/server/power/DisplayPowerState;->setButtonBrightness(I)V

    .line 153
    return-void
.end method
