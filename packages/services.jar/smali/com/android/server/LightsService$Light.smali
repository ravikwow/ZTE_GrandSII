.class public Lcom/android/server/LightsService$Light;
.super Ljava/lang/Object;
.source "LightsService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/LightsService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Light"
.end annotation


# instance fields
.field private mColor:I

.field private mFlashing:Z

.field private mId:I

.field private mMode:I

.field private mOffMS:I

.field private mOnMS:I

.field final synthetic this$0:Lcom/android/server/LightsService;


# direct methods
.method private constructor <init>(Lcom/android/server/LightsService;I)V
    .locals 0
    .param p2, "id"    # I

    .prologue
    .line 72
    iput-object p1, p0, Lcom/android/server/LightsService$Light;->this$0:Lcom/android/server/LightsService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    iput p2, p0, Lcom/android/server/LightsService$Light;->mId:I

    .line 74
    return-void
.end method

.method constructor <init>(Lcom/android/server/LightsService;II)V
    .locals 0
    .param p2, "id"    # I
    .param p3, "unused"    # I

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/server/LightsService$Light;-><init>(Lcom/android/server/LightsService;I)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/LightsService;ILcom/android/server/LightsService$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/server/LightsService;
    .param p2, "x1"    # I
    .param p3, "x2"    # Lcom/android/server/LightsService$1;

    .prologue
    .line 70
    invoke-direct {p0, p1, p2}, Lcom/android/server/LightsService$Light;-><init>(Lcom/android/server/LightsService;I)V

    return-void
.end method

.method static synthetic access$800(Lcom/android/server/LightsService$Light;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/LightsService$Light;

    .prologue
    .line 70
    invoke-direct {p0}, Lcom/android/server/LightsService$Light;->stopFlashing()V

    return-void
.end method

.method private stopFlashing()V
    .locals 6

    .prologue
    .line 126
    monitor-enter p0

    .line 127
    :try_start_0
    iget v1, p0, Lcom/android/server/LightsService$Light;->mColor:I

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/android/server/LightsService$Light;->setLightLocked(IIIII)V

    .line 128
    monitor-exit p0

    .line 129
    return-void

    .line 128
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method


# virtual methods
.method public getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 888
    iget-object v0, p0, Lcom/android/server/LightsService$Light;->this$0:Lcom/android/server/LightsService;

    # getter for: Lcom/android/server/LightsService;->mContext:Landroid/content/Context;
    invoke-static {v0}, Lcom/android/server/LightsService;->access$700(Lcom/android/server/LightsService;)Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public pulse()V
    .locals 2

    .prologue
    .line 107
    const v0, 0xffffff

    const/4 v1, 0x7

    invoke-virtual {p0, v0, v1}, Lcom/android/server/LightsService$Light;->pulse(II)V

    .line 108
    return-void
.end method

.method public pulse(II)V
    .locals 6
    .param p1, "color"    # I
    .param p2, "onMS"    # I

    .prologue
    .line 111
    monitor-enter p0

    .line 112
    :try_start_0
    iget v0, p0, Lcom/android/server/LightsService$Light;->mColor:I

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/server/LightsService$Light;->mFlashing:Z

    if-nez v0, :cond_0

    .line 113
    const/4 v2, 0x2

    const/16 v4, 0x3e8

    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v3, p2

    invoke-virtual/range {v0 .. v5}, Lcom/android/server/LightsService$Light;->setLightLocked(IIIII)V

    .line 114
    iget-object v0, p0, Lcom/android/server/LightsService$Light;->this$0:Lcom/android/server/LightsService;

    # getter for: Lcom/android/server/LightsService;->mH:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/server/LightsService;->access$000(Lcom/android/server/LightsService;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/LightsService$Light;->this$0:Lcom/android/server/LightsService;

    # getter for: Lcom/android/server/LightsService;->mH:Landroid/os/Handler;
    invoke-static {v1}, Lcom/android/server/LightsService;->access$000(Lcom/android/server/LightsService;)Landroid/os/Handler;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v1, v2, p0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    int-to-long v2, p2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 116
    :cond_0
    monitor-exit p0

    .line 117
    return-void

    .line 116
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setBrightness(I)V
    .locals 1
    .param p1, "brightness"    # I

    .prologue
    .line 77
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/server/LightsService$Light;->setBrightness(II)V

    .line 78
    return-void
.end method

.method public setBrightness(II)V
    .locals 6
    .param p1, "brightness"    # I
    .param p2, "brightnessMode"    # I

    .prologue
    .line 86
    monitor-enter p0

    .line 87
    and-int/lit16 v1, p1, 0xff

    .line 88
    .local v1, "color":I
    const/high16 v0, -0x1000000

    shl-int/lit8 v2, v1, 0x10

    or-int/2addr v0, v2

    shl-int/lit8 v2, v1, 0x8

    or-int/2addr v0, v2

    or-int/2addr v1, v0

    .line 89
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move v5, p2

    :try_start_0
    invoke-virtual/range {v0 .. v5}, Lcom/android/server/LightsService$Light;->setLightLocked(IIIII)V

    .line 90
    monitor-exit p0

    .line 91
    return-void

    .line 90
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setColor(I)V
    .locals 6
    .param p1, "color"    # I

    .prologue
    .line 94
    monitor-enter p0

    .line 95
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    :try_start_0
    invoke-virtual/range {v0 .. v5}, Lcom/android/server/LightsService$Light;->setLightLocked(IIIII)V

    .line 96
    monitor-exit p0

    .line 97
    return-void

    .line 96
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setFlashing(IIII)V
    .locals 6
    .param p1, "color"    # I
    .param p2, "mode"    # I
    .param p3, "onMS"    # I
    .param p4, "offMS"    # I

    .prologue
    .line 100
    monitor-enter p0

    .line 101
    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    :try_start_0
    invoke-virtual/range {v0 .. v5}, Lcom/android/server/LightsService$Light;->setLightLocked(IIIII)V

    .line 102
    monitor-exit p0

    .line 103
    return-void

    .line 102
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method setLightLocked(IIIII)V
    .locals 7
    .param p1, "color"    # I
    .param p2, "mode"    # I
    .param p3, "onMS"    # I
    .param p4, "offMS"    # I
    .param p5, "brightnessMode"    # I

    .prologue
    .line 132
    iget v0, p0, Lcom/android/server/LightsService$Light;->mColor:I

    if-ne p1, v0, :cond_0

    iget v0, p0, Lcom/android/server/LightsService$Light;->mMode:I

    if-ne p2, v0, :cond_0

    iget v0, p0, Lcom/android/server/LightsService$Light;->mOnMS:I

    if-ne p3, v0, :cond_0

    iget v0, p0, Lcom/android/server/LightsService$Light;->mOffMS:I

    if-eq p4, v0, :cond_3

    .line 133
    :cond_0
    iget v0, p0, Lcom/android/server/LightsService$Light;->mId:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/server/LightsService$Light;->mId:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/server/LightsService$Light;->mId:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_2

    .line 134
    :cond_1
    const-string v0, "LightsService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setLight #"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/server/LightsService$Light;->mId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": color=#"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    :cond_2
    iput p1, p0, Lcom/android/server/LightsService$Light;->mColor:I

    .line 137
    iput p2, p0, Lcom/android/server/LightsService$Light;->mMode:I

    .line 138
    iput p3, p0, Lcom/android/server/LightsService$Light;->mOnMS:I

    .line 139
    iput p4, p0, Lcom/android/server/LightsService$Light;->mOffMS:I

    .line 140
    iget-object v0, p0, Lcom/android/server/LightsService$Light;->this$0:Lcom/android/server/LightsService;

    # getter for: Lcom/android/server/LightsService;->mNativePointer:I
    invoke-static {v0}, Lcom/android/server/LightsService;->access$100(Lcom/android/server/LightsService;)I

    move-result v0

    iget v1, p0, Lcom/android/server/LightsService$Light;->mId:I

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    # invokes: Lcom/android/server/LightsService;->setLight_native(IIIIIII)V
    invoke-static/range {v0 .. v6}, Lcom/android/server/LightsService;->access$200(IIIIIII)V

    .line 142
    :cond_3
    return-void
.end method

.method public setZteLcdMode(I)V
    .locals 6
    .param p1, "mode"    # I

    .prologue
    const/4 v2, 0x0

    .line 81
    const-string v0, "LightsService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "set lcd mode:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, p0

    move v1, p1

    move v3, v2

    move v4, v2

    move v5, v2

    .line 82
    invoke-virtual/range {v0 .. v5}, Lcom/android/server/LightsService$Light;->setLightLocked(IIIII)V

    .line 83
    return-void
.end method

.method public turnOff()V
    .locals 6

    .prologue
    .line 120
    monitor-enter p0

    .line 121
    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    :try_start_0
    invoke-virtual/range {v0 .. v5}, Lcom/android/server/LightsService$Light;->setLightLocked(IIIII)V

    .line 122
    monitor-exit p0

    .line 123
    return-void

    .line 122
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
