.class public final Lcom/android/server/power/ShutdownThreadInjector;
.super Ljava/lang/Object;
.source "ShutdownThreadInjector.java"


# static fields
.field private static final OPERATOR_ANIMATION_DISABLE_FLAG:Ljava/lang/String; = "/data/system/disable_operator_animation"

.field private static final OPERATOR_MUSIC_DISABLE_FLAG:Ljava/lang/String; = "/data/system/disable_operator_audio"

.field private static final OPERATOR_SHUTDOWN_ANIMATION_FILE:Ljava/lang/String; = "/data/miui/theme/operator/boots/shutdownanimation.zip"

.field private static final OPERATOR_SHUTDOWN_MUSIC_FILE:Ljava/lang/String; = "/data/miui/theme/operator/boots/shutdownaudio.mp3"

.field private static final SHUTDOWN_ACTION_PROPERTY_MIUI:Ljava/lang/String; = "sys.shutdown.miui"

.field private static final SHUTDOWN_ACTION_PROPERTY_MIUI_MUSIC:Ljava/lang/String; = "sys.shutdown.miuimusic"

.field private static final TAG:Ljava/lang/String; = "ShutdownThreadInjector"

.field private static sIsShutdownMusicPlaying:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$002(Z)Z
    .locals 0
    .param p0, "x0"    # Z

    .prologue
    .line 20
    sput-boolean p0, Lcom/android/server/power/ShutdownThreadInjector;->sIsShutdownMusicPlaying:Z

    return p0
.end method

.method static checkAnimationFileExist(Landroid/content/Context;Z)Z
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "isReboot"    # Z

    .prologue
    .line 64
    new-instance v0, Ljava/io/File;

    const-string v1, "/data/system/disable_operator_animation"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/io/File;

    const-string v1, "/data/miui/theme/operator/boots/shutdownanimation.zip"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static getShutdownMusicFilePath(Landroid/content/Context;Z)Ljava/lang/String;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "isReboot"    # Z

    .prologue
    const/4 v0, 0x0

    .line 73
    new-instance v1, Ljava/io/File;

    const-string v2, "/data/system/disable_operator_audio"

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 76
    :cond_0
    :goto_0
    return-object v0

    :cond_1
    new-instance v1, Ljava/io/File;

    const-string v2, "/data/miui/theme/operator/boots/shutdownaudio.mp3"

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v0, "/data/miui/theme/operator/boots/shutdownaudio.mp3"

    goto :goto_0
.end method

.method private static isSilentMode(Landroid/content/Context;)Z
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 140
    const-string v1, "audio"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 141
    .local v0, "audio":Landroid/media/AudioManager;
    invoke-virtual {v0}, Landroid/media/AudioManager;->isSilentMode()Z

    move-result v1

    return v1
.end method

.method static needVibrator()Z
    .locals 1

    .prologue
    .line 28
    const/4 v0, 0x0

    return v0
.end method

.method static playShutdownMusic(Landroid/content/Context;Z)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "isReboot"    # Z

    .prologue
    .line 83
    const-string v1, "sys.shutdown.miui"

    const-string v2, "shutdown"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    invoke-static {p0, p1}, Lcom/android/server/power/ShutdownThreadInjector;->getShutdownMusicFilePath(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v0

    .line 86
    .local v0, "shutdownMusicPath":Ljava/lang/String;
    const-string v1, "ShutdownThreadInjector"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "shutdown music: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p0}, Lcom/android/server/power/ShutdownThreadInjector;->isSilentMode(Landroid/content/Context;)Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    invoke-static {p0}, Lcom/android/server/power/ShutdownThreadInjector;->isSilentMode(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    if-eqz v0, :cond_0

    .line 89
    const-string v1, "sys.shutdown.miuimusic"

    const-string v2, "shutdown_music"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    :cond_0
    return-void
.end method

.method private static playShutdownMusicImpl(Ljava/lang/String;)V
    .locals 11
    .param p0, "shutdownMusicPath"    # Ljava/lang/String;

    .prologue
    .line 96
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 97
    .local v0, "actionDoneSync":Ljava/lang/Object;
    const/4 v7, 0x1

    sput-boolean v7, Lcom/android/server/power/ShutdownThreadInjector;->sIsShutdownMusicPlaying:Z

    .line 100
    :try_start_0
    new-instance v6, Landroid/media/MediaPlayer;

    invoke-direct {v6}, Landroid/media/MediaPlayer;-><init>()V

    .line 101
    .local v6, "mediaPlayer":Landroid/media/MediaPlayer;
    invoke-virtual {v6}, Landroid/media/MediaPlayer;->reset()V

    .line 102
    invoke-virtual {v6, p0}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 103
    invoke-virtual {v6}, Landroid/media/MediaPlayer;->prepare()V

    .line 104
    new-instance v7, Lcom/android/server/power/ShutdownThreadInjector$1;

    invoke-direct {v7, v0}, Lcom/android/server/power/ShutdownThreadInjector$1;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v6, v7}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 114
    invoke-virtual {v6}, Landroid/media/MediaPlayer;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    .end local v6    # "mediaPlayer":Landroid/media/MediaPlayer;
    :goto_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    const-wide/16 v9, 0x1388

    add-long v4, v7, v9

    .line 121
    .local v4, "endTimeForMusic":J
    monitor-enter v0

    .line 122
    :goto_1
    :try_start_1
    sget-boolean v7, Lcom/android/server/power/ShutdownThreadInjector;->sIsShutdownMusicPlaying:Z

    if-eqz v7, :cond_0

    .line 123
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    sub-long v1, v4, v7

    .line 124
    .local v1, "delay":J
    const-wide/16 v7, 0x0

    cmp-long v7, v1, v7

    if-gtz v7, :cond_2

    .line 125
    const-string v7, "ShutdownThreadInjector"

    const-string v8, "play shutdown music timeout"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    .end local v1    # "delay":J
    :cond_0
    sget-boolean v7, Lcom/android/server/power/ShutdownThreadInjector;->sIsShutdownMusicPlaying:Z

    if-nez v7, :cond_1

    .line 134
    const-string v7, "ShutdownThreadInjector"

    const-string v8, "play shutdown music complete"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    :cond_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 137
    return-void

    .line 115
    .end local v4    # "endTimeForMusic":J
    :catch_0
    move-exception v3

    .line 116
    .local v3, "e":Ljava/lang/Exception;
    const/4 v7, 0x0

    sput-boolean v7, Lcom/android/server/power/ShutdownThreadInjector;->sIsShutdownMusicPlaying:Z

    .line 117
    const-string v7, "ShutdownThreadInjector"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "play shutdown music error:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 129
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v1    # "delay":J
    .restart local v4    # "endTimeForMusic":J
    :cond_2
    :try_start_2
    invoke-virtual {v0, v1, v2}, Ljava/lang/Object;->wait(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 130
    :catch_1
    move-exception v7

    goto :goto_1

    .line 136
    .end local v1    # "delay":J
    :catchall_0
    move-exception v7

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v7
.end method

.method static showShutdownAnimation(Landroid/content/Context;Z)V
    .locals 0
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "isReboot"    # Z

    .prologue
    .line 70
    return-void
.end method

.method static showShutdownDialog(Landroid/content/Context;Z)V
    .locals 10
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "isReboot"    # Z

    .prologue
    const/4 v9, 0x0

    .line 32
    new-instance v1, Landroid/app/Dialog;

    sget v6, Landroid/R$style;->Theme_Holo_NoActionBar_Fullscreen:I

    invoke-direct {v1, p0, v6}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 33
    .local v1, "bootMsgDialog":Landroid/app/Dialog;
    invoke-virtual {v1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v6

    const v7, 0x11030002

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    .line 34
    .local v5, "view":Landroid/view/View;
    invoke-virtual {v1, v5}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 35
    invoke-virtual {v1, v9}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 36
    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    .line 37
    .local v2, "lp":Landroid/view/WindowManager$LayoutParams;
    const/4 v6, 0x1

    iput v6, v2, Landroid/view/WindowManager$LayoutParams;->screenOrientation:I

    .line 38
    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v6

    invoke-virtual {v6, v2}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 39
    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v6

    const/16 v7, 0x7e5

    invoke-virtual {v6, v7}, Landroid/view/Window;->setType(I)V

    .line 40
    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    .line 42
    if-eqz p1, :cond_0

    .line 43
    const v6, 0x110b0012

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    .line 44
    .local v4, "shutdownImage":Landroid/widget/ImageView;
    invoke-virtual {v4, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 45
    invoke-virtual {v4}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/AnimatedRotateDrawable;

    .line 46
    .local v0, "animationDrawable":Landroid/graphics/drawable/AnimatedRotateDrawable;
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x11060010

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v6

    invoke-virtual {v0, v6}, Landroid/graphics/drawable/AnimatedRotateDrawable;->setFramesCount(I)V

    .line 47
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x11060011

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v6

    invoke-virtual {v0, v6}, Landroid/graphics/drawable/AnimatedRotateDrawable;->setFramesDuration(I)V

    .line 48
    invoke-virtual {v0}, Landroid/graphics/drawable/AnimatedRotateDrawable;->start()V

    .line 56
    .end local v0    # "animationDrawable":Landroid/graphics/drawable/AnimatedRotateDrawable;
    .end local v4    # "shutdownImage":Landroid/widget/ImageView;
    :goto_0
    return-void

    .line 51
    :cond_0
    const-string v6, "power"

    invoke-virtual {p0, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/PowerManager;

    .line 52
    .local v3, "powerManager":Landroid/os/PowerManager;
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    invoke-virtual {v3, v6, v7}, Landroid/os/PowerManager;->goToSleep(J)V

    .line 54
    const-string v6, "sys.in_shutdown_progress"

    const-string v7, "1"

    invoke-static {v6, v7}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
