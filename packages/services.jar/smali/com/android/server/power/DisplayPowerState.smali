.class final Lcom/android/server/power/DisplayPowerState;
.super Ljava/lang/Object;
.source "DisplayPowerState.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/power/DisplayPowerState$PhotonicModulator;,
        Lcom/android/server/power/DisplayPowerState$ButtonLightTimeoutTask;
    }
.end annotation


# static fields
.field private static DEBUG:Z = false

.field public static final ELECTRON_BEAM_LEVEL:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty",
            "<",
            "Lcom/android/server/power/DisplayPowerState;",
            ">;"
        }
    .end annotation
.end field

.field public static final SCREEN_BRIGHTNESS:Landroid/util/IntProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/IntProperty",
            "<",
            "Lcom/android/server/power/DisplayPowerState;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "DisplayPowerState"


# instance fields
.field private final mBacklight:Lcom/android/server/LightsService$Light;

.field private final mButtonBacklight:Lcom/android/server/LightsService$Light;

.field private mButtonLastValue:I

.field private final mButtonLightTimeoutTask:Lcom/android/server/power/DisplayPowerState$ButtonLightTimeoutTask;

.field private final mChoreographer:Landroid/view/Choreographer;

.field private mCleanListener:Ljava/lang/Runnable;

.field private final mDisplayBlanker:Lcom/android/server/power/DisplayBlanker;

.field private final mElectronBeam:Lcom/android/server/power/ElectronBeam;

.field private mElectronBeamDrawPending:Z

.field private final mElectronBeamDrawRunnable:Ljava/lang/Runnable;

.field private mElectronBeamLevel:F

.field private mElectronBeamPrepared:Z

.field private mElectronBeamReady:Z

.field private final mHandler:Landroid/os/Handler;

.field private final mPhotonicModulator:Lcom/android/server/power/DisplayPowerState$PhotonicModulator;

.field private mScreenBrightness:I

.field private mScreenOn:Z

.field private mScreenReady:Z

.field private mScreenUpdatePending:Z

.field private final mScreenUpdateRunnable:Ljava/lang/Runnable;

.field private mTimeoutHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 53
    const/4 v0, 0x1

    sput-boolean v0, Lcom/android/server/power/DisplayPowerState;->DEBUG:Z

    .line 112
    new-instance v0, Lcom/android/server/power/DisplayPowerState$1;

    const-string v1, "electronBeamLevel"

    invoke-direct {v0, v1}, Lcom/android/server/power/DisplayPowerState$1;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/server/power/DisplayPowerState;->ELECTRON_BEAM_LEVEL:Landroid/util/FloatProperty;

    .line 125
    new-instance v0, Lcom/android/server/power/DisplayPowerState$2;

    const-string v1, "screenBrightness"

    invoke-direct {v0, v1}, Lcom/android/server/power/DisplayPowerState$2;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/server/power/DisplayPowerState;->SCREEN_BRIGHTNESS:Landroid/util/IntProperty;

    return-void
.end method

.method public constructor <init>(Lcom/android/server/power/ElectronBeam;Lcom/android/server/power/DisplayBlanker;Lcom/android/server/LightsService$Light;Lcom/android/server/LightsService$Light;)V
    .locals 3
    .param p1, "electronBean"    # Lcom/android/server/power/ElectronBeam;
    .param p2, "displayBlanker"    # Lcom/android/server/power/DisplayBlanker;
    .param p3, "backlight"    # Lcom/android/server/LightsService$Light;
    .param p4, "buttonlight"    # Lcom/android/server/LightsService$Light;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    new-instance v0, Lcom/android/server/power/DisplayPowerState$ButtonLightTimeoutTask;

    invoke-direct {v0, p0, v2}, Lcom/android/server/power/DisplayPowerState$ButtonLightTimeoutTask;-><init>(Lcom/android/server/power/DisplayPowerState;Lcom/android/server/power/DisplayPowerState$1;)V

    iput-object v0, p0, Lcom/android/server/power/DisplayPowerState;->mButtonLightTimeoutTask:Lcom/android/server/power/DisplayPowerState$ButtonLightTimeoutTask;

    .line 348
    new-instance v0, Lcom/android/server/power/DisplayPowerState$3;

    invoke-direct {v0, p0}, Lcom/android/server/power/DisplayPowerState$3;-><init>(Lcom/android/server/power/DisplayPowerState;)V

    iput-object v0, p0, Lcom/android/server/power/DisplayPowerState;->mScreenUpdateRunnable:Ljava/lang/Runnable;

    .line 361
    new-instance v0, Lcom/android/server/power/DisplayPowerState$4;

    invoke-direct {v0, p0}, Lcom/android/server/power/DisplayPowerState$4;-><init>(Lcom/android/server/power/DisplayPowerState;)V

    iput-object v0, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeamDrawRunnable:Ljava/lang/Runnable;

    .line 86
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Z)V

    iput-object v0, p0, Lcom/android/server/power/DisplayPowerState;->mHandler:Landroid/os/Handler;

    .line 87
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/power/DisplayPowerState;->mChoreographer:Landroid/view/Choreographer;

    .line 88
    iput-object p1, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeam:Lcom/android/server/power/ElectronBeam;

    .line 89
    iput-object p2, p0, Lcom/android/server/power/DisplayPowerState;->mDisplayBlanker:Lcom/android/server/power/DisplayBlanker;

    .line 90
    iput-object p3, p0, Lcom/android/server/power/DisplayPowerState;->mBacklight:Lcom/android/server/LightsService$Light;

    .line 91
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/server/power/DisplayPowerState;->mButtonLastValue:I

    .line 92
    iput-object p4, p0, Lcom/android/server/power/DisplayPowerState;->mButtonBacklight:Lcom/android/server/LightsService$Light;

    .line 93
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Z)V

    iput-object v0, p0, Lcom/android/server/power/DisplayPowerState;->mTimeoutHandler:Landroid/os/Handler;

    .line 95
    new-instance v0, Lcom/android/server/power/DisplayPowerState$PhotonicModulator;

    invoke-direct {v0, p0, v2}, Lcom/android/server/power/DisplayPowerState$PhotonicModulator;-><init>(Lcom/android/server/power/DisplayPowerState;Lcom/android/server/power/DisplayPowerState$1;)V

    iput-object v0, p0, Lcom/android/server/power/DisplayPowerState;->mPhotonicModulator:Lcom/android/server/power/DisplayPowerState$PhotonicModulator;

    .line 103
    iput-boolean v1, p0, Lcom/android/server/power/DisplayPowerState;->mScreenOn:Z

    .line 104
    const/16 v0, 0xff

    iput v0, p0, Lcom/android/server/power/DisplayPowerState;->mScreenBrightness:I

    .line 105
    invoke-direct {p0}, Lcom/android/server/power/DisplayPowerState;->scheduleScreenUpdate()V

    .line 107
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeamPrepared:Z

    .line 108
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeamLevel:F

    .line 109
    iput-boolean v1, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeamReady:Z

    .line 110
    return-void
.end method

.method static synthetic access$1000(Lcom/android/server/power/DisplayPowerState;)Z
    .locals 1
    .param p0, "x0"    # Lcom/android/server/power/DisplayPowerState;

    .prologue
    .line 50
    iget-boolean v0, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeamPrepared:Z

    return v0
.end method

.method static synthetic access$1100(Lcom/android/server/power/DisplayPowerState;)Lcom/android/server/power/ElectronBeam;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/power/DisplayPowerState;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeam:Lcom/android/server/power/ElectronBeam;

    return-object v0
.end method

.method static synthetic access$1202(Lcom/android/server/power/DisplayPowerState;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/android/server/power/DisplayPowerState;
    .param p1, "x1"    # Z

    .prologue
    .line 50
    iput-boolean p1, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeamReady:Z

    return p1
.end method

.method static synthetic access$1300()Z
    .locals 1

    .prologue
    .line 50
    sget-boolean v0, Lcom/android/server/power/DisplayPowerState;->DEBUG:Z

    return v0
.end method

.method static synthetic access$2000(Lcom/android/server/power/DisplayPowerState;)Lcom/android/server/power/DisplayBlanker;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/power/DisplayPowerState;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/android/server/power/DisplayPowerState;->mDisplayBlanker:Lcom/android/server/power/DisplayBlanker;

    return-object v0
.end method

.method static synthetic access$202(Lcom/android/server/power/DisplayPowerState;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/android/server/power/DisplayPowerState;
    .param p1, "x1"    # Z

    .prologue
    .line 50
    iput-boolean p1, p0, Lcom/android/server/power/DisplayPowerState;->mScreenUpdatePending:Z

    return p1
.end method

.method static synthetic access$2100(Lcom/android/server/power/DisplayPowerState;)Lcom/android/server/LightsService$Light;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/power/DisplayPowerState;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/android/server/power/DisplayPowerState;->mBacklight:Lcom/android/server/LightsService$Light;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/android/server/power/DisplayPowerState;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/power/DisplayPowerState;

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/android/server/power/DisplayPowerState;->postScreenUpdateThreadSafe()V

    return-void
.end method

.method static synthetic access$300(Lcom/android/server/power/DisplayPowerState;)Z
    .locals 1
    .param p0, "x0"    # Lcom/android/server/power/DisplayPowerState;

    .prologue
    .line 50
    iget-boolean v0, p0, Lcom/android/server/power/DisplayPowerState;->mScreenOn:Z

    return v0
.end method

.method static synthetic access$400(Lcom/android/server/power/DisplayPowerState;)F
    .locals 1
    .param p0, "x0"    # Lcom/android/server/power/DisplayPowerState;

    .prologue
    .line 50
    iget v0, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeamLevel:F

    return v0
.end method

.method static synthetic access$500(Lcom/android/server/power/DisplayPowerState;)I
    .locals 1
    .param p0, "x0"    # Lcom/android/server/power/DisplayPowerState;

    .prologue
    .line 50
    iget v0, p0, Lcom/android/server/power/DisplayPowerState;->mScreenBrightness:I

    return v0
.end method

.method static synthetic access$600(Lcom/android/server/power/DisplayPowerState;)Lcom/android/server/power/DisplayPowerState$PhotonicModulator;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/power/DisplayPowerState;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/android/server/power/DisplayPowerState;->mPhotonicModulator:Lcom/android/server/power/DisplayPowerState$PhotonicModulator;

    return-object v0
.end method

.method static synthetic access$702(Lcom/android/server/power/DisplayPowerState;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/android/server/power/DisplayPowerState;
    .param p1, "x1"    # Z

    .prologue
    .line 50
    iput-boolean p1, p0, Lcom/android/server/power/DisplayPowerState;->mScreenReady:Z

    return p1
.end method

.method static synthetic access$800(Lcom/android/server/power/DisplayPowerState;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/power/DisplayPowerState;

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/android/server/power/DisplayPowerState;->invokeCleanListenerIfNeeded()V

    return-void
.end method

.method static synthetic access$902(Lcom/android/server/power/DisplayPowerState;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/android/server/power/DisplayPowerState;
    .param p1, "x1"    # Z

    .prologue
    .line 50
    iput-boolean p1, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeamDrawPending:Z

    return p1
.end method

.method private invokeCleanListenerIfNeeded()V
    .locals 2

    .prologue
    .line 341
    iget-object v0, p0, Lcom/android/server/power/DisplayPowerState;->mCleanListener:Ljava/lang/Runnable;

    .line 342
    .local v0, "listener":Ljava/lang/Runnable;
    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/android/server/power/DisplayPowerState;->mScreenReady:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeamReady:Z

    if-eqz v1, :cond_0

    .line 343
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/server/power/DisplayPowerState;->mCleanListener:Ljava/lang/Runnable;

    .line 344
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 346
    :cond_0
    return-void
.end method

.method private postScreenUpdateThreadSafe()V
    .locals 2

    .prologue
    .line 328
    iget-object v0, p0, Lcom/android/server/power/DisplayPowerState;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/server/power/DisplayPowerState;->mScreenUpdateRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 329
    iget-object v0, p0, Lcom/android/server/power/DisplayPowerState;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/server/power/DisplayPowerState;->mScreenUpdateRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 330
    return-void
.end method

.method private scheduleElectronBeamDraw()V
    .locals 4

    .prologue
    .line 333
    iget-boolean v0, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeamDrawPending:Z

    if-nez v0, :cond_0

    .line 334
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeamDrawPending:Z

    .line 335
    iget-object v0, p0, Lcom/android/server/power/DisplayPowerState;->mChoreographer:Landroid/view/Choreographer;

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeamDrawRunnable:Ljava/lang/Runnable;

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/Choreographer;->postCallback(ILjava/lang/Runnable;Ljava/lang/Object;)V

    .line 338
    :cond_0
    return-void
.end method

.method private scheduleScreenUpdate()V
    .locals 1

    .prologue
    .line 321
    iget-boolean v0, p0, Lcom/android/server/power/DisplayPowerState;->mScreenUpdatePending:Z

    if-nez v0, :cond_0

    .line 322
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/power/DisplayPowerState;->mScreenUpdatePending:Z

    .line 323
    invoke-direct {p0}, Lcom/android/server/power/DisplayPowerState;->postScreenUpdateThreadSafe()V

    .line 325
    :cond_0
    return-void
.end method


# virtual methods
.method public dismissElectronBeam()V
    .locals 1

    .prologue
    .line 245
    iget-object v0, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeam:Lcom/android/server/power/ElectronBeam;

    invoke-virtual {v0}, Lcom/android/server/power/ElectronBeam;->dismiss()V

    .line 246
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeamPrepared:Z

    .line 247
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeamReady:Z

    .line 248
    return-void
.end method

.method public dump(Ljava/io/PrintWriter;)V
    .locals 2
    .param p1, "pw"    # Ljava/io/PrintWriter;

    .prologue
    .line 305
    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    .line 306
    const-string v0, "Display Power State:"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 307
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  mScreenOn="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/server/power/DisplayPowerState;->mScreenOn:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 308
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  mScreenBrightness="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/power/DisplayPowerState;->mScreenBrightness:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 309
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  mScreenReady="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/server/power/DisplayPowerState;->mScreenReady:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 310
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  mScreenUpdatePending="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/server/power/DisplayPowerState;->mScreenUpdatePending:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 311
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  mElectronBeamPrepared="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeamPrepared:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 312
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  mElectronBeamLevel="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeamLevel:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 313
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  mElectronBeamReady="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeamReady:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 314
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  mElectronBeamDrawPending="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeamDrawPending:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 316
    iget-object v0, p0, Lcom/android/server/power/DisplayPowerState;->mPhotonicModulator:Lcom/android/server/power/DisplayPowerState$PhotonicModulator;

    invoke-virtual {v0, p1}, Lcom/android/server/power/DisplayPowerState$PhotonicModulator;->dump(Ljava/io/PrintWriter;)V

    .line 317
    iget-object v0, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeam:Lcom/android/server/power/ElectronBeam;

    invoke-virtual {v0, p1}, Lcom/android/server/power/ElectronBeam;->dump(Ljava/io/PrintWriter;)V

    .line 318
    return-void
.end method

.method public getElectronBeamLevel()F
    .locals 1

    .prologue
    .line 285
    iget v0, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeamLevel:F

    return v0
.end method

.method public getScreenBrightness()I
    .locals 1

    .prologue
    .line 217
    iget v0, p0, Lcom/android/server/power/DisplayPowerState;->mScreenBrightness:I

    return v0
.end method

.method public isScreenOn()Z
    .locals 1

    .prologue
    .line 190
    iget-boolean v0, p0, Lcom/android/server/power/DisplayPowerState;->mScreenOn:Z

    return v0
.end method

.method public prepareElectronBeam(I)Z
    .locals 3
    .param p1, "mode"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 229
    iget-object v2, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeam:Lcom/android/server/power/ElectronBeam;

    invoke-virtual {v2, p1}, Lcom/android/server/power/ElectronBeam;->prepare(I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 230
    iput-boolean v0, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeamPrepared:Z

    .line 231
    iput-boolean v1, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeamReady:Z

    .line 238
    :goto_0
    return v0

    .line 235
    :cond_0
    iput-boolean v1, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeamPrepared:Z

    .line 236
    iput-boolean v0, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeamReady:Z

    .line 237
    invoke-direct {p0}, Lcom/android/server/power/DisplayPowerState;->scheduleElectronBeamDraw()V

    move v0, v1

    .line 238
    goto :goto_0
.end method

.method public setButtonBrightness(I)V
    .locals 3
    .param p1, "value"    # I

    .prologue
    .line 141
    iget-object v0, p0, Lcom/android/server/power/DisplayPowerState;->mButtonBacklight:Lcom/android/server/LightsService$Light;

    invoke-virtual {v0, p1}, Lcom/android/server/LightsService$Light;->setBrightness(I)V

    .line 142
    const-string v0, "DisplayPowerState"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "gavin setButtonBrightness mButtonLastValue: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/server/power/DisplayPowerState;->mButtonLastValue:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    iget v0, p0, Lcom/android/server/power/DisplayPowerState;->mButtonLastValue:I

    if-eq v0, p1, :cond_0

    .line 144
    iget-object v0, p0, Lcom/android/server/power/DisplayPowerState;->mButtonBacklight:Lcom/android/server/LightsService$Light;

    invoke-virtual {v0, p1}, Lcom/android/server/LightsService$Light;->setBrightness(I)V

    .line 145
    iput p1, p0, Lcom/android/server/power/DisplayPowerState;->mButtonLastValue:I

    .line 147
    :cond_0
    return-void
.end method

.method public setButtonlightBrightness(I)V
    .locals 4
    .param p1, "brightness"    # I

    .prologue
    .line 157
    if-lez p1, :cond_1

    .line 159
    iget-object v0, p0, Lcom/android/server/power/DisplayPowerState;->mButtonBacklight:Lcom/android/server/LightsService$Light;

    invoke-virtual {v0}, Lcom/android/server/LightsService$Light;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "juelian_button_light_auto"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/juelian/JuelianUtils;->getSystemInt(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_0

    const-string v1, "screen_brightness"

    goto :goto_0

    :cond_0
    const-string v1, "juelian_button_light"

    :goto_0
    iget-object v0, p0, Lcom/android/server/power/DisplayPowerState;->mButtonBacklight:Lcom/android/server/LightsService$Light;

    invoke-virtual {v0}, Lcom/android/server/LightsService$Light;->getContext()Landroid/content/Context;

    move-result-object v0

    const/16 v2, 0x10

    invoke-static {v0, v1, v2}, Landroid/juelian/JuelianUtils;->getSystemInt(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/server/power/DisplayPowerState;->setButtonBrightness(I)V

    .line 160
    iget-object v0, p0, Lcom/android/server/power/DisplayPowerState;->mTimeoutHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/server/power/DisplayPowerState;->mButtonLightTimeoutTask:Lcom/android/server/power/DisplayPowerState$ButtonLightTimeoutTask;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 161
    iget-object v0, p0, Lcom/android/server/power/DisplayPowerState;->mTimeoutHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/server/power/DisplayPowerState;->mButtonLightTimeoutTask:Lcom/android/server/power/DisplayPowerState$ButtonLightTimeoutTask;

    iget-object v2, p0, Lcom/android/server/power/DisplayPowerState;->mButtonBacklight:Lcom/android/server/LightsService$Light;

    invoke-virtual {v2}, Lcom/android/server/LightsService$Light;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/juelian/JuelianUtils;->getScreenButtonTime(Landroid/content/Context;)J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 168
    :goto_1
    return-void

    .line 165
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/server/power/DisplayPowerState;->setButtonBrightness(I)V

    .line 166
    iget-object v0, p0, Lcom/android/server/power/DisplayPowerState;->mTimeoutHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/server/power/DisplayPowerState;->mButtonLightTimeoutTask:Lcom/android/server/power/DisplayPowerState$ButtonLightTimeoutTask;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    goto :goto_1
.end method

.method public setElectronBeamLevel(F)V
    .locals 4
    .param p1, "level"    # F

    .prologue
    const/4 v3, 0x0

    .line 264
    iget v0, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeamLevel:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_2

    .line 265
    sget-boolean v0, Lcom/android/server/power/DisplayPowerState;->DEBUG:Z

    if-eqz v0, :cond_0

    .line 266
    const-string v0, "DisplayPowerState"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setElectronBeamLevel: level="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 269
    :cond_0
    iput p1, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeamLevel:F

    .line 270
    iget-boolean v0, p0, Lcom/android/server/power/DisplayPowerState;->mScreenOn:Z

    if-eqz v0, :cond_1

    .line 271
    iput-boolean v3, p0, Lcom/android/server/power/DisplayPowerState;->mScreenReady:Z

    .line 272
    invoke-direct {p0}, Lcom/android/server/power/DisplayPowerState;->scheduleScreenUpdate()V

    .line 274
    :cond_1
    iget-boolean v0, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeamPrepared:Z

    if-eqz v0, :cond_2

    .line 275
    iput-boolean v3, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeamReady:Z

    .line 276
    invoke-direct {p0}, Lcom/android/server/power/DisplayPowerState;->scheduleElectronBeamDraw()V

    .line 279
    :cond_2
    return-void
.end method

.method public setScreenBrightness(I)V
    .locals 3
    .param p1, "brightness"    # I

    .prologue
    .line 199
    const-string v0, "DisplayPowerState"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mScreenBrightness="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/server/power/DisplayPowerState;->mScreenBrightness:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " brightness="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    iget v0, p0, Lcom/android/server/power/DisplayPowerState;->mScreenBrightness:I

    if-eq v0, p1, :cond_1

    .line 201
    sget-boolean v0, Lcom/android/server/power/DisplayPowerState;->DEBUG:Z

    if-eqz v0, :cond_0

    .line 202
    const-string v0, "DisplayPowerState"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setScreenBrightness: brightness="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    :cond_0
    iput p1, p0, Lcom/android/server/power/DisplayPowerState;->mScreenBrightness:I

    .line 206
    iget-boolean v0, p0, Lcom/android/server/power/DisplayPowerState;->mScreenOn:Z

    if-eqz v0, :cond_1

    .line 207
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/power/DisplayPowerState;->mScreenReady:Z

    .line 208
    invoke-direct {p0}, Lcom/android/server/power/DisplayPowerState;->scheduleScreenUpdate()V

    .line 211
    :cond_1
    return-void
.end method

.method public setScreenOn(Z)V
    .locals 3
    .param p1, "on"    # Z

    .prologue
    .line 175
    iget-boolean v0, p0, Lcom/android/server/power/DisplayPowerState;->mScreenOn:Z

    if-eq v0, p1, :cond_1

    .line 176
    sget-boolean v0, Lcom/android/server/power/DisplayPowerState;->DEBUG:Z

    if-eqz v0, :cond_0

    .line 177
    const-string v0, "DisplayPowerState"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setScreenOn: on="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 180
    :cond_0
    iput-boolean p1, p0, Lcom/android/server/power/DisplayPowerState;->mScreenOn:Z

    .line 181
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/power/DisplayPowerState;->mScreenReady:Z

    .line 182
    invoke-direct {p0}, Lcom/android/server/power/DisplayPowerState;->scheduleScreenUpdate()V

    .line 184
    :cond_1
    return-void
.end method

.method public waitUntilClean(Ljava/lang/Runnable;)Z
    .locals 1
    .param p1, "listener"    # Ljava/lang/Runnable;

    .prologue
    .line 295
    iget-boolean v0, p0, Lcom/android/server/power/DisplayPowerState;->mScreenReady:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/server/power/DisplayPowerState;->mElectronBeamReady:Z

    if-nez v0, :cond_1

    .line 296
    :cond_0
    iput-object p1, p0, Lcom/android/server/power/DisplayPowerState;->mCleanListener:Ljava/lang/Runnable;

    .line 297
    const/4 v0, 0x0

    .line 300
    :goto_0
    return v0

    .line 299
    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/power/DisplayPowerState;->mCleanListener:Ljava/lang/Runnable;

    .line 300
    const/4 v0, 0x1

    goto :goto_0
.end method
