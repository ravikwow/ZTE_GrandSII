.class public Lcom/android/server/HandyMode;
.super Ljava/lang/Object;
.source "HandyMode.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/HandyMode$RotationWatcher;
    }
.end annotation


# static fields
.field private static BLURED_WALLPAPER_FILE:Ljava/lang/String; = null

.field public static final COMBINATION_CLICK_TIMEOUT:I

.field static final MODE_LEFT:I = 0x1

.field static final MODE_NONE:I = 0x0

.field static final MODE_RIGHT:I = 0x2

.field private static SETTING_ICON_FILE:Ljava/lang/String;

.field private static TITLE_IMAGE_FILE:Ljava/lang/String;

.field private static sAlertDialog:Ljava/lang/ref/SoftReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/SoftReference",
            "<",
            "Landroid/app/Dialog;",
            ">;"
        }
    .end annotation
.end field

.field static sBootCompleted:Z

.field static sContext:Landroid/content/Context;

.field static sDeviceProvisioned:Z

.field static sEnable:Z

.field static sFiledTitleLanguage:Ljava/lang/String;

.field static sHandler:Landroid/os/Handler;

.field static sHandyModeInputFilter:Lcom/android/server/HandyModeInputFilter;

.field static sHandyModeUtils:Lmiui/util/HandyModeUtils;

.field static sIconHeight:I

.field static sIconWidth:I

.field static sInputManager:Lcom/android/server/input/InputManagerService;

.field private static sMode:I

.field static sPowerManager:Landroid/os/PowerManager;

.field static sReceiver:Landroid/content/BroadcastReceiver;

.field static sRegistered:Z

.field static sRotation:I

.field static sRotationWatcher:Lcom/android/server/HandyMode$RotationWatcher;

.field static sScale:F

.field static sScreenHeight:I

.field static sScreenWidth:I

.field static sSettingClickListener:Ljava/lang/Runnable;

.field static sSettingIconPadding:I

.field static sWallpaperManager:Landroid/app/WallpaperManager;

.field static sWindowManager:Landroid/view/IWindowManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 67
    const-string v0, "/data/system/blured_wallpaper.png"

    sput-object v0, Lcom/android/server/HandyMode;->BLURED_WALLPAPER_FILE:Ljava/lang/String;

    .line 68
    const-string v0, "/data/system/setting_icon_for_handymode.png"

    sput-object v0, Lcom/android/server/HandyMode;->SETTING_ICON_FILE:Ljava/lang/String;

    .line 69
    const-string v0, "/data/system/title_image_for_handymode.png"

    sput-object v0, Lcom/android/server/HandyMode;->TITLE_IMAGE_FILE:Ljava/lang/String;

    .line 76
    const/4 v0, 0x0

    sput v0, Lcom/android/server/HandyMode;->sMode:I

    .line 77
    const-string v0, "persist.sys.handy_mode_cct"

    const/16 v1, 0x50

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/android/server/HandyMode;->COMBINATION_CLICK_TIMEOUT:I

    .line 103
    new-instance v0, Lcom/android/server/HandyMode$1;

    invoke-direct {v0}, Lcom/android/server/HandyMode$1;-><init>()V

    sput-object v0, Lcom/android/server/HandyMode;->sSettingClickListener:Ljava/lang/Runnable;

    .line 122
    new-instance v0, Lcom/android/server/HandyMode$2;

    invoke-direct {v0}, Lcom/android/server/HandyMode$2;-><init>()V

    sput-object v0, Lcom/android/server/HandyMode;->sReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 109
    return-void
.end method

.method static synthetic access$000()I
    .locals 1

    .prologue
    .line 66
    sget v0, Lcom/android/server/HandyMode;->sMode:I

    return v0
.end method

.method static synthetic access$100()V
    .locals 0

    .prologue
    .line 66
    invoke-static {}, Lcom/android/server/HandyMode;->refreshStatus()V

    return-void
.end method

.method static synthetic access$200()V
    .locals 0

    .prologue
    .line 66
    invoke-static {}, Lcom/android/server/HandyMode;->destroyBluredWallpaper()V

    return-void
.end method

.method public static alertToEnter(I)V
    .locals 6
    .param p0, "newMode"    # I

    .prologue
    const/4 v3, 0x0

    .line 235
    invoke-static {}, Lcom/android/server/HandyMode;->canEnterHandyMode()Z

    move-result v2

    if-nez v2, :cond_1

    .line 257
    :cond_0
    :goto_0
    return-void

    .line 237
    :cond_1
    sget-object v2, Lcom/android/server/HandyMode;->sContext:Landroid/content/Context;

    const-string v4, "keyguard"

    invoke-virtual {v2, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/KeyguardManager;

    .line 238
    .local v1, "km":Landroid/app/KeyguardManager;
    invoke-virtual {v1}, Landroid/app/KeyguardManager;->isKeyguardLocked()Z

    move-result v2

    if-nez v2, :cond_0

    .line 240
    sget-object v2, Lcom/android/server/HandyMode;->sAlertDialog:Ljava/lang/ref/SoftReference;

    if-nez v2, :cond_3

    move-object v0, v3

    .line 241
    .local v0, "dlg":Landroid/app/Dialog;
    :goto_1
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v2

    if-nez v2, :cond_0

    .line 242
    :cond_2
    new-instance v2, Landroid/app/AlertDialog$Builder;

    sget-object v4, Lcom/android/server/HandyMode;->sContext:Landroid/content/Context;

    invoke-direct {v2, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v4, 0x1107009b

    invoke-virtual {v2, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v4, 0x1107009c

    invoke-virtual {v2, v4}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    sget v4, Landroid/R$string;->ok:I

    new-instance v5, Lcom/android/server/HandyMode$6;

    invoke-direct {v5, p0}, Lcom/android/server/HandyMode$6;-><init>(I)V

    invoke-virtual {v2, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    sget v4, Landroid/R$string;->cancel:I

    invoke-virtual {v2, v4, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 253
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/16 v3, 0x7d8

    invoke-virtual {v2, v3}, Landroid/view/Window;->setType(I)V

    .line 254
    new-instance v2, Ljava/lang/ref/SoftReference;

    invoke-direct {v2, v0}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    sput-object v2, Lcom/android/server/HandyMode;->sAlertDialog:Ljava/lang/ref/SoftReference;

    .line 255
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    goto :goto_0

    .line 240
    .end local v0    # "dlg":Landroid/app/Dialog;
    :cond_3
    sget-object v2, Lcom/android/server/HandyMode;->sAlertDialog:Ljava/lang/ref/SoftReference;

    invoke-virtual {v2}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Dialog;

    move-object v0, v2

    goto :goto_1
.end method

.method private static buildBluredWallpaper(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 14
    .param p0, "wallpaper"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v13, 0x1

    const/4 v12, 0x0

    .line 422
    sget v10, Lcom/android/server/HandyMode;->sScreenWidth:I

    sget v11, Lmiui/util/ScreenshotUtils;->sMinification:I

    div-int/2addr v10, v11

    invoke-static {v10, v13}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 423
    .local v2, "dstWidth":I
    sget v10, Lcom/android/server/HandyMode;->sScreenHeight:I

    sget v11, Lmiui/util/ScreenshotUtils;->sMinification:I

    div-int/2addr v10, v11

    invoke-static {v10, v13}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 425
    .local v0, "dstHeight":I
    sget-object v10, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v0, v10}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 426
    .local v4, "newBitmap":Landroid/graphics/Bitmap;
    new-instance v5, Landroid/graphics/Canvas;

    invoke-direct {v5, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 428
    .local v5, "newCanvas":Landroid/graphics/Canvas;
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1, v12, v12, v2, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 429
    .local v1, "dstRect":Landroid/graphics/Rect;
    new-instance v7, Landroid/graphics/Rect;

    invoke-direct {v7}, Landroid/graphics/Rect;-><init>()V

    .line 432
    .local v7, "srcRect":Landroid/graphics/Rect;
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v10

    div-int/2addr v10, v2

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v11

    div-int/2addr v11, v0

    if-le v10, v11, :cond_0

    .line 433
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    int-to-float v10, v10

    int-to-float v11, v0

    div-float/2addr v10, v11

    int-to-float v11, v2

    mul-float/2addr v10, v11

    float-to-int v8, v10

    .line 434
    .local v8, "srcWidth":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v10

    sub-int/2addr v10, v8

    div-int/lit8 v3, v10, 0x2

    .line 435
    .local v3, "left":I
    add-int v10, v3, v8

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v11

    invoke-virtual {v7, v3, v12, v10, v11}, Landroid/graphics/Rect;->set(IIII)V

    .line 442
    .end local v3    # "left":I
    .end local v8    # "srcWidth":I
    :goto_0
    new-instance v10, Landroid/graphics/Paint;

    const/4 v11, 0x2

    invoke-direct {v10, v11}, Landroid/graphics/Paint;-><init>(I)V

    invoke-virtual {v5, p0, v7, v1, v10}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 443
    const/high16 v10, 0x437f0000    # 255.0f

    sget v11, Lmiui/util/ScreenshotUtils;->sBlack:F

    mul-float/2addr v10, v11

    float-to-int v10, v10

    invoke-static {v10, v12, v12, v12}, Landroid/graphics/Color;->argb(IIII)I

    move-result v10

    invoke-virtual {v5, v10}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 444
    sget-object v10, Lcom/android/server/HandyMode;->sContext:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x110d000a

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getColor(I)I

    move-result v10

    invoke-virtual {v5, v10}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 446
    sget v10, Lmiui/util/ScreenshotUtils;->sBlurRadius:I

    invoke-static {v4, v10}, Lmiui/graphics/BitmapFactory;->fastBlur(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object v10

    return-object v10

    .line 437
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v10

    int-to-float v10, v10

    int-to-float v11, v2

    div-float/2addr v10, v11

    int-to-float v11, v0

    mul-float/2addr v10, v11

    float-to-int v6, v10

    .line 438
    .local v6, "srcHeight":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    sub-int/2addr v10, v6

    div-int/lit8 v9, v10, 0x2

    .line 439
    .local v9, "top":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v10

    add-int v11, v9, v6

    invoke-virtual {v7, v12, v9, v10, v11}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0
.end method

.method static canEnterHandyMode()Z
    .locals 5

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 260
    sget-object v1, Lcom/android/server/HandyMode;->sHandyModeUtils:Lmiui/util/HandyModeUtils;

    invoke-virtual {v1}, Lmiui/util/HandyModeUtils;->isFeatureVisible()Z

    move-result v1

    if-nez v1, :cond_1

    .line 280
    .local v0, "ex":Landroid/os/RemoteException;
    :cond_0
    :goto_0
    return v3

    .line 262
    .end local v0    # "ex":Landroid/os/RemoteException;
    :cond_1
    sget-boolean v1, Lcom/android/server/HandyMode;->sBootCompleted:Z

    if-nez v1, :cond_2

    .line 263
    const-string v1, "sys.boot_completed"

    invoke-static {v1, v3}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    sput-boolean v1, Lcom/android/server/HandyMode;->sBootCompleted:Z

    .line 264
    sget-boolean v1, Lcom/android/server/HandyMode;->sBootCompleted:Z

    if-eqz v1, :cond_0

    .line 267
    :cond_2
    sget-boolean v1, Lcom/android/server/HandyMode;->sDeviceProvisioned:Z

    if-nez v1, :cond_3

    .line 268
    sget-object v1, Lcom/android/server/HandyMode;->sContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v4, "device_provisioned"

    invoke-static {v1, v4, v3}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_4

    move v1, v2

    :goto_1
    sput-boolean v1, Lcom/android/server/HandyMode;->sDeviceProvisioned:Z

    .line 269
    sget-boolean v1, Lcom/android/server/HandyMode;->sDeviceProvisioned:Z

    if-eqz v1, :cond_0

    .line 273
    :cond_3
    :try_start_0
    sget-object v1, Lcom/android/server/HandyMode;->sWindowManager:Landroid/view/IWindowManager;

    invoke-interface {v1}, Landroid/view/IWindowManager;->getRotation()I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    if-nez v1, :cond_0

    .line 278
    invoke-static {}, Lcom/android/server/HandyMode;->isChildrenModeEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    move v3, v2

    .line 280
    goto :goto_0

    :cond_4
    move v1, v3

    .line 268
    goto :goto_1

    .line 274
    :catch_0
    move-exception v0

    .line 275
    .restart local v0    # "ex":Landroid/os/RemoteException;
    goto :goto_0
.end method

.method public static changeMode(I)V
    .locals 15
    .param p0, "mode"    # I

    .prologue
    .line 284
    if-eqz p0, :cond_1

    invoke-static {}, Lcom/android/server/HandyMode;->canEnterHandyMode()Z

    move-result v9

    if-nez v9, :cond_1

    .line 352
    :cond_0
    :goto_0
    return-void

    .line 286
    :cond_1
    sget-object v9, Lcom/android/server/HandyMode;->sPowerManager:Landroid/os/PowerManager;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v10

    const/4 v12, 0x0

    invoke-virtual {v9, v10, v11, v12}, Landroid/os/PowerManager;->userActivity(JZ)V

    .line 288
    sput p0, Lcom/android/server/HandyMode;->sMode:I

    .line 289
    sget-object v9, Lcom/android/server/HandyMode;->sHandyModeInputFilter:Lcom/android/server/HandyModeInputFilter;

    sget-object v10, Lcom/android/server/HandyMode;->sSettingClickListener:Ljava/lang/Runnable;

    invoke-virtual {v9, v10}, Lcom/android/server/HandyModeInputFilter;->removeOutsideClickableRect(Ljava/lang/Runnable;)V

    .line 291
    if-eqz p0, :cond_8

    .line 292
    sget-object v9, Lcom/android/server/HandyMode;->sWallpaperManager:Landroid/app/WallpaperManager;

    if-nez v9, :cond_2

    .line 293
    sget-object v9, Lcom/android/server/HandyMode;->sContext:Landroid/content/Context;

    const-string v10, "wallpaper"

    invoke-virtual {v9, v10}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/app/WallpaperManager;

    sput-object v9, Lcom/android/server/HandyMode;->sWallpaperManager:Landroid/app/WallpaperManager;

    .line 296
    :cond_2
    sget-boolean v9, Lcom/android/server/HandyMode;->sRegistered:Z

    if-nez v9, :cond_4

    .line 297
    sget-object v9, Lcom/android/server/HandyMode;->sContext:Landroid/content/Context;

    sget-object v10, Lcom/android/server/HandyMode;->sReceiver:Landroid/content/BroadcastReceiver;

    new-instance v11, Landroid/content/IntentFilter;

    const-string v12, "android.intent.action.SCREEN_OFF"

    invoke-direct {v11, v12}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v10, v11}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 298
    sget-object v9, Lcom/android/server/HandyMode;->sRotationWatcher:Lcom/android/server/HandyMode$RotationWatcher;

    if-nez v9, :cond_3

    new-instance v9, Lcom/android/server/HandyMode$RotationWatcher;

    invoke-direct {v9}, Lcom/android/server/HandyMode$RotationWatcher;-><init>()V

    sput-object v9, Lcom/android/server/HandyMode;->sRotationWatcher:Lcom/android/server/HandyMode$RotationWatcher;

    .line 300
    :cond_3
    :try_start_0
    sget-object v9, Lcom/android/server/HandyMode;->sWindowManager:Landroid/view/IWindowManager;

    sget-object v10, Lcom/android/server/HandyMode;->sRotationWatcher:Lcom/android/server/HandyMode$RotationWatcher;

    invoke-interface {v9, v10}, Landroid/view/IWindowManager;->watchRotation(Landroid/view/IRotationWatcher;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1

    .line 304
    :goto_1
    const/4 v9, 0x1

    sput-boolean v9, Lcom/android/server/HandyMode;->sRegistered:Z

    .line 307
    :cond_4
    invoke-static {}, Lcom/android/server/HandyMode;->ensureAllImages()V

    .line 308
    invoke-static {}, Lcom/android/server/HandyMode;->ensureBluredWallpaper()V

    .line 310
    sget v9, Lcom/android/server/HandyMode;->sScreenWidth:I

    int-to-float v9, v9

    const/high16 v10, 0x3f800000    # 1.0f

    sget v11, Lcom/android/server/HandyMode;->sScale:F

    sub-float/2addr v10, v11

    mul-float/2addr v9, v10

    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v9

    sget v10, Lcom/android/server/HandyMode;->sIconWidth:I

    sub-int/2addr v9, v10

    div-int/lit8 v4, v9, 0x2

    .line 311
    .local v4, "iconToBorder":I
    sget v9, Lcom/android/server/HandyMode;->sMode:I

    const/4 v10, 0x2

    if-ne v9, v10, :cond_6

    move v6, v4

    .line 312
    .local v6, "left":I
    :goto_2
    sget v9, Lcom/android/server/HandyMode;->sIconWidth:I

    add-int v7, v6, v9

    .line 313
    .local v7, "right":I
    sget v9, Lcom/android/server/HandyMode;->sScreenHeight:I

    sub-int/2addr v9, v4

    sget v10, Lcom/android/server/HandyMode;->sIconHeight:I

    sub-int v8, v9, v10

    .line 314
    .local v8, "top":I
    sget v9, Lcom/android/server/HandyMode;->sIconHeight:I

    add-int v0, v8, v9

    .line 315
    .local v0, "bottom":I
    sget-object v9, Lcom/android/server/HandyMode;->sHandyModeInputFilter:Lcom/android/server/HandyModeInputFilter;

    new-instance v10, Landroid/graphics/Rect;

    sget v11, Lcom/android/server/HandyMode;->sSettingIconPadding:I

    sub-int v11, v6, v11

    sget v12, Lcom/android/server/HandyMode;->sSettingIconPadding:I

    sub-int v12, v8, v12

    sget v13, Lcom/android/server/HandyMode;->sSettingIconPadding:I

    add-int/2addr v13, v7

    sget v14, Lcom/android/server/HandyMode;->sSettingIconPadding:I

    add-int/2addr v14, v0

    invoke-direct {v10, v11, v12, v13, v14}, Landroid/graphics/Rect;-><init>(IIII)V

    sget-object v11, Lcom/android/server/HandyMode;->sSettingClickListener:Ljava/lang/Runnable;

    invoke-virtual {v9, v10, v11}, Lcom/android/server/HandyModeInputFilter;->addOutsideClickableRect(Landroid/graphics/Rect;Ljava/lang/Runnable;)V

    .line 320
    sget-object v9, Lcom/android/server/HandyMode;->sHandyModeUtils:Lmiui/util/HandyModeUtils;

    invoke-virtual {v9}, Lmiui/util/HandyModeUtils;->hasShowed()Z

    move-result v9

    if-nez v9, :cond_7

    const/4 v5, 0x1

    .line 321
    .local v5, "isFirstTime":Z
    :goto_3
    if-eqz v5, :cond_5

    .line 322
    sget-object v9, Lcom/android/server/HandyMode;->sHandyModeUtils:Lmiui/util/HandyModeUtils;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lmiui/util/HandyModeUtils;->setEnterDirect(Z)V

    .line 323
    invoke-static {}, Lcom/android/server/HandyMode;->gotoHandyModeSetting()V

    .line 339
    .end local v0    # "bottom":I
    .end local v4    # "iconToBorder":I
    .end local v5    # "isFirstTime":Z
    .end local v6    # "left":I
    .end local v7    # "right":I
    .end local v8    # "top":I
    :cond_5
    :goto_4
    :try_start_1
    const-string v9, "SurfaceFlinger"

    invoke-static {v9}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v3

    .line 340
    .local v3, "flinger":Landroid/os/IBinder;
    if-eqz v3, :cond_0

    .line 341
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 342
    .local v1, "data":Landroid/os/Parcel;
    const-string v9, "android.ui.ISurfaceComposer"

    invoke-virtual {v1, v9}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 343
    invoke-virtual {v1, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 344
    sget v9, Lcom/android/server/HandyMode;->sScale:F

    invoke-virtual {v1, v9}, Landroid/os/Parcel;->writeFloat(F)V

    .line 345
    const/16 v9, 0x44a

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-interface {v3, v9, v1, v10, v11}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 346
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 348
    .end local v1    # "data":Landroid/os/Parcel;
    .end local v3    # "flinger":Landroid/os/IBinder;
    :catch_0
    move-exception v2

    .line 349
    .local v2, "ex":Landroid/os/RemoteException;
    invoke-virtual {v2}, Landroid/os/RemoteException;->printStackTrace()V

    goto/16 :goto_0

    .line 301
    .end local v2    # "ex":Landroid/os/RemoteException;
    :catch_1
    move-exception v2

    .line 302
    .restart local v2    # "ex":Landroid/os/RemoteException;
    invoke-virtual {v2}, Landroid/os/RemoteException;->printStackTrace()V

    goto/16 :goto_1

    .line 311
    .end local v2    # "ex":Landroid/os/RemoteException;
    .restart local v4    # "iconToBorder":I
    :cond_6
    sget v9, Lcom/android/server/HandyMode;->sScreenWidth:I

    int-to-float v9, v9

    sget v10, Lcom/android/server/HandyMode;->sScale:F

    mul-float/2addr v9, v10

    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v9

    add-int v6, v9, v4

    goto :goto_2

    .line 320
    .restart local v0    # "bottom":I
    .restart local v6    # "left":I
    .restart local v7    # "right":I
    .restart local v8    # "top":I
    :cond_7
    const/4 v5, 0x0

    goto :goto_3

    .line 326
    .end local v0    # "bottom":I
    .end local v4    # "iconToBorder":I
    .end local v6    # "left":I
    .end local v7    # "right":I
    .end local v8    # "top":I
    :cond_8
    sget-boolean v9, Lcom/android/server/HandyMode;->sRegistered:Z

    if-eqz v9, :cond_5

    .line 327
    sget-object v9, Lcom/android/server/HandyMode;->sContext:Landroid/content/Context;

    sget-object v10, Lcom/android/server/HandyMode;->sReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v9, v10}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 329
    :try_start_2
    sget-object v9, Lcom/android/server/HandyMode;->sWindowManager:Landroid/view/IWindowManager;

    sget-object v10, Lcom/android/server/HandyMode;->sRotationWatcher:Lcom/android/server/HandyMode$RotationWatcher;

    invoke-interface {v9, v10}, Landroid/view/IWindowManager;->removeRotationWatcher(Landroid/view/IRotationWatcher;)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_2

    .line 333
    :goto_5
    const/4 v9, 0x0

    sput-boolean v9, Lcom/android/server/HandyMode;->sRegistered:Z

    goto :goto_4

    .line 330
    :catch_2
    move-exception v2

    .line 331
    .restart local v2    # "ex":Landroid/os/RemoteException;
    invoke-virtual {v2}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_5
.end method

.method private static destroyBluredWallpaper()V
    .locals 2

    .prologue
    .line 355
    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/android/server/HandyMode;->BLURED_WALLPAPER_FILE:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 356
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 357
    :cond_0
    return-void
.end method

.method private static ensureAllImages()V
    .locals 2

    .prologue
    .line 360
    sget-object v0, Lcom/android/server/HandyMode;->SETTING_ICON_FILE:Ljava/lang/String;

    const v1, 0x1102001d

    invoke-static {v0, v1}, Lcom/android/server/HandyMode;->ensureIcon(Ljava/lang/String;I)V

    .line 361
    invoke-static {}, Lcom/android/server/HandyMode;->ensureTitleImage()V

    .line 362
    return-void
.end method

.method private static ensureBluredWallpaper()V
    .locals 4

    .prologue
    .line 403
    new-instance v1, Ljava/io/File;

    sget-object v3, Lcom/android/server/HandyMode;->BLURED_WALLPAPER_FILE:Ljava/lang/String;

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 405
    .local v1, "file":Ljava/io/File;
    sget-object v3, Lcom/android/server/HandyMode;->sWallpaperManager:Landroid/app/WallpaperManager;

    invoke-virtual {v3}, Landroid/app/WallpaperManager;->getWallpaperInfo()Landroid/app/WallpaperInfo;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 406
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 419
    :cond_0
    :goto_0
    return-void

    .line 410
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    .line 412
    sget-object v3, Lcom/android/server/HandyMode;->sWallpaperManager:Landroid/app/WallpaperManager;

    invoke-virtual {v3}, Landroid/app/WallpaperManager;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    .line 413
    .local v2, "wallpaper":Landroid/graphics/Bitmap;
    if-eqz v2, :cond_0

    .line 415
    invoke-static {v2}, Lcom/android/server/HandyMode;->buildBluredWallpaper(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 416
    .local v0, "bluredBitmap":Landroid/graphics/Bitmap;
    invoke-static {v0, v1}, Lcom/android/server/HandyMode;->saveBitmapToPNG(Landroid/graphics/Bitmap;Ljava/io/File;)V

    .line 418
    sget-object v3, Lcom/android/server/HandyMode;->sWallpaperManager:Landroid/app/WallpaperManager;

    invoke-virtual {v3}, Landroid/app/WallpaperManager;->forgetLoadedWallpaper()V

    goto :goto_0
.end method

.method private static ensureIcon(Ljava/lang/String;I)V
    .locals 3
    .param p0, "fileName"    # Ljava/lang/String;
    .param p1, "iconId"    # I

    .prologue
    .line 394
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 395
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 396
    sget-object v2, Lcom/android/server/HandyMode;->sContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v1

    .line 397
    .local v1, "is":Ljava/io/InputStream;
    invoke-static {v1, v0}, Landroid/os/FileUtils;->copyToFile(Ljava/io/InputStream;Ljava/io/File;)Z

    .line 398
    invoke-static {v1}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 400
    .end local v1    # "is":Ljava/io/InputStream;
    :cond_0
    return-void
.end method

.method private static ensureTitleImage()V
    .locals 15

    .prologue
    const/4 v14, 0x0

    .line 365
    new-instance v3, Ljava/io/File;

    sget-object v11, Lcom/android/server/HandyMode;->TITLE_IMAGE_FILE:Ljava/lang/String;

    invoke-direct {v3, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 366
    .local v3, "file":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v11

    if-eqz v11, :cond_0

    sget-object v11, Lcom/android/server/HandyMode;->sContext:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v11

    iget-object v11, v11, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v11}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v11

    sget-object v12, Lcom/android/server/HandyMode;->sFiledTitleLanguage:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1

    .line 367
    :cond_0
    sget-object v11, Lcom/android/server/HandyMode;->sContext:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v11

    iget-object v11, v11, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v11}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v11

    sput-object v11, Lcom/android/server/HandyMode;->sFiledTitleLanguage:Ljava/lang/String;

    .line 369
    sget-object v11, Lcom/android/server/HandyMode;->sContext:Landroid/content/Context;

    invoke-static {v11}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v11

    const v12, 0x11030006

    const/4 v13, 0x0

    invoke-virtual {v11, v12, v13}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v6

    .line 370
    .local v6, "rootView":Landroid/view/View;
    const/high16 v11, 0x42700000    # 60.0f

    sget-object v12, Lcom/android/server/HandyMode;->sContext:Landroid/content/Context;

    invoke-virtual {v12}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    invoke-virtual {v12}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v12

    iget v12, v12, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v11, v12

    float-to-int v5, v11

    .line 371
    .local v5, "padding":I
    sget-object v11, Lcom/android/server/HandyMode;->sContext:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v11

    iget v7, v11, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 372
    .local v7, "screenWidth":I
    mul-int/lit8 v11, v5, 0x2

    sub-int v11, v7, v11

    const/high16 v12, -0x80000000

    invoke-static {v11, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v10

    .line 373
    .local v10, "widthMeasureSpec":I
    invoke-static {v14, v14}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    .line 374
    .local v4, "heightMeasureSpec":I
    invoke-virtual {v6, v10, v4}, Landroid/view/View;->measure(II)V

    .line 375
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    move-result v11

    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    move-result v12

    invoke-virtual {v6, v14, v14, v11, v12}, Landroid/view/View;->layout(IIII)V

    .line 377
    invoke-virtual {v6}, Landroid/view/View;->getWidth()I

    move-result v11

    invoke-virtual {v6}, Landroid/view/View;->getHeight()I

    move-result v12

    sget-object v13, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v11, v12, v13}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 378
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 379
    .local v1, "canvas":Landroid/graphics/Canvas;
    invoke-virtual {v6, v1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 381
    const/4 v8, 0x0

    .line 383
    .local v8, "stream":Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v9, Ljava/io/FileOutputStream;

    invoke-direct {v9, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 384
    .end local v8    # "stream":Ljava/io/FileOutputStream;
    .local v9, "stream":Ljava/io/FileOutputStream;
    :try_start_1
    sget-object v11, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v12, 0x64

    invoke-virtual {v0, v11, v12, v9}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 388
    invoke-static {v9}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 391
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "canvas":Landroid/graphics/Canvas;
    .end local v4    # "heightMeasureSpec":I
    .end local v5    # "padding":I
    .end local v6    # "rootView":Landroid/view/View;
    .end local v7    # "screenWidth":I
    .end local v9    # "stream":Ljava/io/FileOutputStream;
    .end local v10    # "widthMeasureSpec":I
    :cond_1
    :goto_0
    return-void

    .line 385
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v1    # "canvas":Landroid/graphics/Canvas;
    .restart local v4    # "heightMeasureSpec":I
    .restart local v5    # "padding":I
    .restart local v6    # "rootView":Landroid/view/View;
    .restart local v7    # "screenWidth":I
    .restart local v8    # "stream":Ljava/io/FileOutputStream;
    .restart local v10    # "widthMeasureSpec":I
    :catch_0
    move-exception v2

    .line 386
    .local v2, "ex":Ljava/io/IOException;
    :goto_1
    :try_start_2
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 388
    invoke-static {v8}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    goto :goto_0

    .end local v2    # "ex":Ljava/io/IOException;
    :catchall_0
    move-exception v11

    :goto_2
    invoke-static {v8}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    throw v11

    .end local v8    # "stream":Ljava/io/FileOutputStream;
    .restart local v9    # "stream":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v11

    move-object v8, v9

    .end local v9    # "stream":Ljava/io/FileOutputStream;
    .restart local v8    # "stream":Ljava/io/FileOutputStream;
    goto :goto_2

    .line 385
    .end local v8    # "stream":Ljava/io/FileOutputStream;
    .restart local v9    # "stream":Ljava/io/FileOutputStream;
    :catch_1
    move-exception v2

    move-object v8, v9

    .end local v9    # "stream":Ljava/io/FileOutputStream;
    .restart local v8    # "stream":Ljava/io/FileOutputStream;
    goto :goto_1
.end method

.method public static getMode()I
    .locals 1

    .prologue
    .line 460
    sget v0, Lcom/android/server/HandyMode;->sMode:I

    return v0
.end method

.method static gotoHandyModeSetting()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 216
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 217
    .local v0, "settingIntent":Landroid/content/Intent;
    const-string v1, "com.android.settings"

    const-string v2, "com.android.settings.Settings"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 218
    const-string v1, ":android:show_fragment"

    const-string v2, "com.android.settings.display.HandyModeFragment"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 219
    const-string v1, ":android:show_fragment_title"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 220
    const-string v1, ":android:show_fragment_short_title"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 221
    const-string v1, ":android:no_headers"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 222
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 223
    sget-object v1, Lcom/android/server/HandyMode;->sContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 224
    return-void
.end method

.method public static initialize(Landroid/content/Context;Lcom/android/server/input/InputManagerService;)V
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "inputManager"    # Lcom/android/server/input/InputManagerService;

    .prologue
    .line 131
    sget-object v5, Lcom/android/server/HandyMode;->sContext:Landroid/content/Context;

    if-eqz v5, :cond_1

    .line 181
    :cond_0
    :goto_0
    return-void

    .line 133
    :cond_1
    sput-object p0, Lcom/android/server/HandyMode;->sContext:Landroid/content/Context;

    .line 134
    new-instance v5, Landroid/os/Handler;

    invoke-virtual {p0}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v5, Lcom/android/server/HandyMode;->sHandler:Landroid/os/Handler;

    .line 135
    invoke-static {p0}, Lmiui/util/HandyModeUtils;->getInstance(Landroid/content/Context;)Lmiui/util/HandyModeUtils;

    move-result-object v5

    sput-object v5, Lcom/android/server/HandyMode;->sHandyModeUtils:Lmiui/util/HandyModeUtils;

    .line 137
    sget-object v5, Lcom/android/server/HandyMode;->sHandyModeUtils:Lmiui/util/HandyModeUtils;

    invoke-virtual {v5}, Lmiui/util/HandyModeUtils;->isFeatureVisible()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 139
    sput-object p1, Lcom/android/server/HandyMode;->sInputManager:Lcom/android/server/input/InputManagerService;

    .line 140
    const-string v5, "window"

    invoke-static {v5}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v5

    invoke-static {v5}, Landroid/view/IWindowManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/view/IWindowManager;

    move-result-object v5

    sput-object v5, Lcom/android/server/HandyMode;->sWindowManager:Landroid/view/IWindowManager;

    .line 141
    new-instance v5, Lcom/android/server/HandyModeInputFilter;

    invoke-direct {v5, p0}, Lcom/android/server/HandyModeInputFilter;-><init>(Landroid/content/Context;)V

    sput-object v5, Lcom/android/server/HandyMode;->sHandyModeInputFilter:Lcom/android/server/HandyModeInputFilter;

    .line 142
    const-string v5, "power"

    invoke-virtual {p0, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/os/PowerManager;

    sput-object v5, Lcom/android/server/HandyMode;->sPowerManager:Landroid/os/PowerManager;

    .line 144
    const-string v5, "window"

    invoke-virtual {p0, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/WindowManager;

    .line 145
    .local v4, "wm":Landroid/view/WindowManager;
    new-instance v3, Landroid/graphics/Point;

    invoke-direct {v3}, Landroid/graphics/Point;-><init>()V

    .line 146
    .local v3, "size":Landroid/graphics/Point;
    invoke-interface {v4}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v5

    invoke-virtual {v5, v3}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 147
    iget v5, v3, Landroid/graphics/Point;->x:I

    iget v6, v3, Landroid/graphics/Point;->y:I

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v5

    sput v5, Lcom/android/server/HandyMode;->sScreenWidth:I

    .line 148
    iget v5, v3, Landroid/graphics/Point;->x:I

    iget v6, v3, Landroid/graphics/Point;->y:I

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    sput v5, Lcom/android/server/HandyMode;->sScreenHeight:I

    .line 149
    const/high16 v5, 0x40a00000    # 5.0f

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v6

    iget v6, v6, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    sput v5, Lcom/android/server/HandyMode;->sSettingIconPadding:I

    .line 151
    sget-object v5, Lcom/android/server/HandyMode;->sHandyModeUtils:Lmiui/util/HandyModeUtils;

    invoke-virtual {v5}, Lmiui/util/HandyModeUtils;->isEnable()Z

    move-result v5

    sput-boolean v5, Lcom/android/server/HandyMode;->sEnable:Z

    .line 152
    sget-object v5, Lcom/android/server/HandyMode;->sHandyModeUtils:Lmiui/util/HandyModeUtils;

    invoke-virtual {v5}, Lmiui/util/HandyModeUtils;->getScale()F

    move-result v5

    sput v5, Lcom/android/server/HandyMode;->sScale:F

    .line 153
    sget-object v5, Lcom/android/server/HandyMode;->sInputManager:Lcom/android/server/input/InputManagerService;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lcom/android/server/input/InputManagerService;->setInputFilter(Landroid/view/IInputFilter;)V

    .line 155
    new-instance v1, Lcom/android/server/HandyMode$3;

    new-instance v5, Landroid/os/Handler;

    sget-object v6, Lcom/android/server/HandyMode;->sContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-direct {v1, v5}, Lcom/android/server/HandyMode$3;-><init>(Landroid/os/Handler;)V

    .line 161
    .local v1, "observer":Landroid/database/ContentObserver;
    sget-object v5, Lcom/android/server/HandyMode;->sContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "handy_mode_size"

    invoke-static {v6}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7, v1}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 164
    sget-object v5, Lcom/android/server/HandyMode;->sContext:Landroid/content/Context;

    new-instance v6, Lcom/android/server/HandyMode$4;

    invoke-direct {v6}, Lcom/android/server/HandyMode$4;-><init>()V

    new-instance v7, Landroid/content/IntentFilter;

    const-string v8, "android.intent.action.WALLPAPER_CHANGED"

    invoke-direct {v7, v8}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 170
    new-instance v0, Ljava/io/File;

    sget-object v5, Lcom/android/server/HandyMode;->SETTING_ICON_FILE:Ljava/lang/String;

    invoke-direct {v0, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 171
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 173
    :cond_2
    new-instance v0, Ljava/io/File;

    .end local v0    # "file":Ljava/io/File;
    sget-object v5, Lcom/android/server/HandyMode;->TITLE_IMAGE_FILE:Ljava/lang/String;

    invoke-direct {v0, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 174
    .restart local v0    # "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 176
    :cond_3
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 177
    .local v2, "opts":Landroid/graphics/BitmapFactory$Options;
    const/4 v5, 0x1

    iput-boolean v5, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 178
    sget-object v5, Lcom/android/server/HandyMode;->sContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x1102001c

    invoke-static {v5, v6, v2}, Lmiui/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 179
    iget v5, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    sput v5, Lcom/android/server/HandyMode;->sIconWidth:I

    .line 180
    iget v5, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    sput v5, Lcom/android/server/HandyMode;->sIconHeight:I

    goto/16 :goto_0
.end method

.method public static isChildrenModeEnabled()Z
    .locals 3

    .prologue
    .line 227
    sget-object v0, Lcom/android/server/HandyMode;->sContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "children_mode_enabled"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/MiuiSettings$Secure;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static processInputFilter(Landroid/view/IInputFilter;)Landroid/view/IInputFilter;
    .locals 1
    .param p0, "inputFilter"    # Landroid/view/IInputFilter;

    .prologue
    .line 206
    if-nez p0, :cond_1

    sget-object v0, Lcom/android/server/HandyMode;->sHandyModeUtils:Lmiui/util/HandyModeUtils;

    invoke-virtual {v0}, Lmiui/util/HandyModeUtils;->isFeatureVisible()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 207
    sget-object p0, Lcom/android/server/HandyMode;->sHandyModeInputFilter:Lcom/android/server/HandyModeInputFilter;

    .line 212
    :cond_0
    :goto_0
    return-object p0

    .line 209
    :cond_1
    sget v0, Lcom/android/server/HandyMode;->sMode:I

    if-eqz v0, :cond_0

    .line 210
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/android/server/HandyMode;->changeMode(I)V

    goto :goto_0
.end method

.method private static refreshStatus()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 184
    sget-boolean v2, Lcom/android/server/HandyMode;->sEnable:Z

    sget-object v3, Lcom/android/server/HandyMode;->sHandyModeUtils:Lmiui/util/HandyModeUtils;

    invoke-virtual {v3}, Lmiui/util/HandyModeUtils;->isEnable()Z

    move-result v3

    if-eq v2, v3, :cond_0

    .line 185
    sget-object v2, Lcom/android/server/HandyMode;->sHandyModeUtils:Lmiui/util/HandyModeUtils;

    invoke-virtual {v2}, Lmiui/util/HandyModeUtils;->isEnable()Z

    move-result v2

    sput-boolean v2, Lcom/android/server/HandyMode;->sEnable:Z

    .line 186
    sget-boolean v2, Lcom/android/server/HandyMode;->sEnable:Z

    if-nez v2, :cond_0

    sget v2, Lcom/android/server/HandyMode;->sMode:I

    if-eqz v2, :cond_0

    .line 187
    invoke-static {v4}, Lcom/android/server/HandyMode;->changeMode(I)V

    .line 190
    :cond_0
    sget v2, Lcom/android/server/HandyMode;->sScale:F

    sget-object v3, Lcom/android/server/HandyMode;->sHandyModeUtils:Lmiui/util/HandyModeUtils;

    invoke-virtual {v3}, Lmiui/util/HandyModeUtils;->getScale()F

    move-result v3

    cmpl-float v2, v2, v3

    if-eqz v2, :cond_1

    .line 191
    sget-object v2, Lcom/android/server/HandyMode;->sHandyModeUtils:Lmiui/util/HandyModeUtils;

    invoke-virtual {v2}, Lmiui/util/HandyModeUtils;->getScale()F

    move-result v2

    sput v2, Lcom/android/server/HandyMode;->sScale:F

    .line 192
    sget v2, Lcom/android/server/HandyMode;->sMode:I

    if-eqz v2, :cond_1

    .line 193
    sget v1, Lcom/android/server/HandyMode;->sMode:I

    .line 194
    .local v1, "mode":I
    invoke-static {v4}, Lcom/android/server/HandyMode;->changeMode(I)V

    .line 195
    new-instance v0, Landroid/os/Handler;

    sget-object v2, Lcom/android/server/HandyMode;->sContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 196
    .local v0, "handler":Landroid/os/Handler;
    new-instance v2, Lcom/android/server/HandyMode$5;

    invoke-direct {v2, v1}, Lcom/android/server/HandyMode$5;-><init>(I)V

    const-wide/16 v3, 0x12c

    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 203
    :cond_1
    return-void
.end method

.method private static saveBitmapToPNG(Landroid/graphics/Bitmap;Ljava/io/File;)V
    .locals 4
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 451
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 452
    .local v1, "os":Ljava/io/FileOutputStream;
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v3, 0x64

    invoke-virtual {p0, v2, v3, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 453
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 457
    .end local v1    # "os":Ljava/io/FileOutputStream;
    :goto_0
    return-void

    .line 454
    :catch_0
    move-exception v0

    .line 455
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
