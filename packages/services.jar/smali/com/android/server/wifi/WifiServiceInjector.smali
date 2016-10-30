.class public Lcom/android/server/wifi/WifiServiceInjector;
.super Ljava/lang/Object;
.source "WifiServiceInjector.java"


# static fields
.field private static final FOREGROUND_APP_ADJ:I = 0x0

.field private static final PERCEPTIBLE_APP_ADJ:I = 0x2

.field private static final TAG:Ljava/lang/String; = "WifiServiceInjector"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static CheckIfBackgroundScanAllowed(Landroid/os/WorkSource;)Z
    .locals 7
    .param p0, "workSource"    # Landroid/os/WorkSource;

    .prologue
    const/4 v5, 0x1

    .line 18
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v1

    .line 19
    .local v1, "callerUid":I
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v0

    .line 21
    .local v0, "callerPid":I
    const/16 v6, 0x2710

    if-gt v1, v6, :cond_1

    .line 32
    :cond_0
    :goto_0
    return v5

    .line 25
    :cond_1
    invoke-static {v0}, Lcom/android/server/am/ExtraActivityManagerService;->getCurAdjByPid(I)I

    move-result v2

    .line 26
    .local v2, "curAdj":I
    invoke-static {v0}, Lcom/android/server/am/ExtraActivityManagerService;->getProcStateByPid(I)I

    move-result v4

    .line 27
    .local v4, "procState":I
    invoke-static {v0}, Lcom/android/server/am/ExtraActivityManagerService;->hasForegroundActivities(I)Z

    move-result v3

    .line 29
    .local v3, "hasForegroundActivities":Z
    if-nez v3, :cond_0

    const/4 v6, 0x2

    if-gt v2, v6, :cond_2

    const/16 v6, 0x8

    if-ne v4, v6, :cond_0

    .line 32
    :cond_2
    const/4 v5, 0x0

    goto :goto_0
.end method
