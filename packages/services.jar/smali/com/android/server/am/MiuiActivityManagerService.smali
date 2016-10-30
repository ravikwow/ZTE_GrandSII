.class Lcom/android/server/am/MiuiActivityManagerService;
.super Ljava/lang/Object;
.source "MiuiActivityManagerService.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getCallingUidPackage(Lcom/android/server/am/ActivityManagerService;Landroid/os/IBinder;)Ljava/lang/String;
    .locals 1
    .param p0, "service"    # Lcom/android/server/am/ActivityManagerService;
    .param p1, "token"    # Landroid/os/IBinder;

    .prologue
    .line 19
    invoke-static {p0, p1}, Lcom/android/server/am/ActivityManagerServiceInjector;->getCallingUidPackage(Lcom/android/server/am/ActivityManagerService;Landroid/os/IBinder;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static showAppCrashDialog(Lcom/android/server/am/ActivityManagerService;Ljava/util/HashMap;)Z
    .locals 1
    .param p0, "ams"    # Lcom/android/server/am/ActivityManagerService;
    .param p1, "data"    # Ljava/util/HashMap;

    .prologue
    .line 15
    invoke-static {p0, p1}, Lcom/android/server/am/ActivityManagerServiceInjector;->showAppCrashDialog(Lcom/android/server/am/ActivityManagerService;Ljava/util/HashMap;)Z

    move-result v0

    return v0
.end method
