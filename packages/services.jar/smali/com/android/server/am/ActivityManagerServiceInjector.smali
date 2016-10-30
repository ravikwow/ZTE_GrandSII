.class Lcom/android/server/am/ActivityManagerServiceInjector;
.super Ljava/lang/Object;
.source "ActivityManagerServiceInjector.java"


# static fields
.field static mProtectedProcessList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 114
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/server/am/ActivityManagerServiceInjector;->mProtectedProcessList:Ljava/util/ArrayList;

    .line 116
    sget-object v0, Lcom/android/server/am/ActivityManagerServiceInjector;->mProtectedProcessList:Ljava/util/ArrayList;

    const-string v1, "com.android.phone"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 117
    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static finishActivity(Lcom/android/server/am/ActivityManagerService;Landroid/os/IBinder;ILandroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p0, "ams"    # Lcom/android/server/am/ActivityManagerService;
    .param p1, "token"    # Landroid/os/IBinder;
    .param p2, "resultCode"    # I
    .param p3, "resultData"    # Landroid/content/Intent;

    .prologue
    .line 95
    invoke-static {p0, p1, p2, p3}, Lcom/android/server/am/ExtraActivityManagerService;->finishActivity(Lcom/android/server/am/ActivityManagerService;Landroid/os/IBinder;ILandroid/content/Intent;)Landroid/os/IBinder;

    move-result-object v0

    return-object v0
.end method

.method static finishBooting(Lcom/android/server/am/ActivityManagerService;)V
    .locals 0
    .param p0, "ams"    # Lcom/android/server/am/ActivityManagerService;

    .prologue
    .line 91
    invoke-static {p0}, Lcom/android/server/am/ExtraActivityManagerService;->finishBooting(Lcom/android/server/am/ActivityManagerService;)V

    .line 92
    return-void
.end method

.method static getCallingUidPackage(Lcom/android/server/am/ActivityManagerService;Landroid/os/IBinder;)Ljava/lang/String;
    .locals 5
    .param p0, "service"    # Lcom/android/server/am/ActivityManagerService;
    .param p1, "token"    # Landroid/os/IBinder;

    .prologue
    const/4 v3, 0x0

    .line 69
    invoke-virtual {p0}, Lcom/android/server/am/ActivityManagerService;->getFocusedStack()Lcom/android/server/am/ActivityStack;

    move-result-object v4

    invoke-virtual {v4, p1}, Lcom/android/server/am/ActivityStack;->isInStackLocked(Landroid/os/IBinder;)Lcom/android/server/am/ActivityRecord;

    move-result-object v2

    .line 70
    .local v2, "r":Lcom/android/server/am/ActivityRecord;
    if-nez v2, :cond_1

    .line 83
    :cond_0
    :goto_0
    return-object v3

    .line 71
    :cond_1
    iget v0, v2, Lcom/android/server/am/ActivityRecord;->launchedFromUid:I

    .line 74
    .local v0, "callingUid":I
    if-lez v0, :cond_0

    .line 76
    :try_start_0
    invoke-static {}, Landroid/app/AppGlobals;->getPackageManager()Landroid/content/pm/IPackageManager;

    move-result-object v4

    invoke-interface {v4, v0}, Landroid/content/pm/IPackageManager;->getPackagesForUid(I)[Ljava/lang/String;

    move-result-object v1

    .line 77
    .local v1, "packages":[Ljava/lang/String;
    if-eqz v1, :cond_0

    array-length v4, v1

    if-lez v4, :cond_0

    .line 78
    const/4 v4, 0x0

    aget-object v3, v1, v4
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 80
    .end local v1    # "packages":[Ljava/lang/String;
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method static handleExtraConfigurationChangesForSystem(ILandroid/content/res/Configuration;)V
    .locals 0
    .param p0, "changes"    # I
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 87
    invoke-static {p0, p1}, Lcom/android/server/am/ExtraActivityManagerService;->handleExtraConfigurationChangesForSystem(ILandroid/content/res/Configuration;)V

    .line 88
    return-void
.end method

.method static final init(Landroid/content/Context;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 24
    sget v0, Lmiui/R$style;->Theme_Light:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->setTheme(I)V

    .line 26
    invoke-static {}, Lcom/android/server/am/ExtraActivityManagerService;->init()V

    .line 27
    return-void
.end method

.method static isStartWithBackupRestriction(Landroid/content/Context;Ljava/lang/String;Lcom/android/server/am/ProcessRecord;)Z
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "backupPkgName"    # Ljava/lang/String;
    .param p2, "app"    # Lcom/android/server/am/ProcessRecord;

    .prologue
    .line 109
    iget-object v1, p2, Lcom/android/server/am/ProcessRecord;->instrumentationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v1, :cond_0

    iget-object v0, p2, Lcom/android/server/am/ProcessRecord;->instrumentationInfo:Landroid/content/pm/ApplicationInfo;

    .line 111
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    :goto_0
    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-static {p0, v1}, Lmiui/app/backup/BackupManager;->isSysAppForBackup(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x1

    :goto_1
    return v1

    .line 109
    .end local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    :cond_0
    iget-object v0, p2, Lcom/android/server/am/ProcessRecord;->info:Landroid/content/pm/ApplicationInfo;

    goto :goto_0

    .line 111
    .restart local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method static final killNativePackageProcesses(Landroid/content/Context;Ljava/lang/String;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 31
    :try_start_0
    invoke-static {}, Landroid/app/AppGlobals;->getPackageManager()Landroid/content/pm/IPackageManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {v2, p1, v3}, Landroid/content/pm/IPackageManager;->getPackageUid(Ljava/lang/String;I)I

    move-result v1

    .line 32
    .local v1, "uid":I
    const-string v2, "security"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/security/SecurityManager;

    .line 33
    .local v0, "sm":Lmiui/security/SecurityManager;
    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 34
    invoke-virtual {v0, v1, p1}, Lmiui/security/SecurityManager;->killNativePackageProcesses(ILjava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .end local v0    # "sm":Lmiui/security/SecurityManager;
    .end local v1    # "uid":I
    :cond_0
    :goto_0
    return-void

    .line 35
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public static processInitBefore(Ljava/lang/String;)Z
    .locals 2
    .param p0, "processName"    # Ljava/lang/String;

    .prologue
    .line 120
    const/4 v0, 0x1

    .line 121
    .local v0, "hasInit":Z
    if-eqz p0, :cond_0

    .line 122
    sget-object v1, Lcom/android/server/am/ActivityManagerServiceInjector;->mProtectedProcessList:Ljava/util/ArrayList;

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v0, 0x1

    .line 124
    :cond_0
    :goto_0
    return v0

    .line 122
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static setProcessInitState(Ljava/lang/String;)Z
    .locals 3
    .param p0, "processName"    # Ljava/lang/String;

    .prologue
    .line 128
    if-eqz p0, :cond_0

    sget-object v0, Lcom/android/server/am/ActivityManagerServiceInjector;->mProtectedProcessList:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 129
    sget-object v0, Lcom/android/server/am/ActivityManagerServiceInjector;->mProtectedProcessList:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 130
    const-string v0, "ActivityManagerServiceInjector"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Remove:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " in mProtectedProcessList"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    const/4 v0, 0x1

    .line 134
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static showAppCrashDialog(Lcom/android/server/am/ActivityManagerService;Ljava/util/HashMap;)Z
    .locals 8
    .param p0, "ams"    # Lcom/android/server/am/ActivityManagerService;
    .param p1, "data"    # Ljava/util/HashMap;

    .prologue
    const/4 v6, 0x1

    const/4 v1, 0x0

    .line 45
    iget-object v2, p0, Lcom/android/server/am/ActivityManagerService;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lmiui/util/ErrorReport;->isUserAllowed(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 65
    :goto_0
    return v1

    .line 48
    :cond_0
    const-string v2, "app"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/server/am/ProcessRecord;

    .line 49
    .local v4, "proc":Lcom/android/server/am/ProcessRecord;
    const-string v2, "result"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/am/AppErrorResult;

    .line 50
    .local v3, "res":Lcom/android/server/am/AppErrorResult;
    const-string v2, "crash"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/ApplicationErrorReport$CrashInfo;

    .line 52
    .local v5, "crashInfo":Landroid/app/ApplicationErrorReport$CrashInfo;
    iget-object v2, p0, Lcom/android/server/am/ActivityManagerService;->mContext:Landroid/content/Context;

    iget-object v7, v4, Lcom/android/server/am/ProcessRecord;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v7, v7, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-static {v2, v7, v5, v6}, Lmiui/util/ErrorReport;->sendExceptionReport(Landroid/content/Context;Ljava/lang/String;Landroid/app/ApplicationErrorReport$CrashInfo;I)V

    .line 55
    iget-object v2, p0, Lcom/android/server/am/ActivityManagerService;->mContext:Landroid/content/Context;

    invoke-static {v2}, Landroid/provider/MiuiSettings$Secure;->isForceCloseDialogEnabled(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 56
    new-instance v0, Lcom/android/server/am/AppErrorDialog;

    iget-object v1, p0, Lcom/android/server/am/ActivityManagerService;->mContext:Landroid/content/Context;

    move-object v2, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/server/am/AppErrorDialog;-><init>(Landroid/content/Context;Lcom/android/server/am/ActivityManagerService;Lcom/android/server/am/AppErrorResult;Lcom/android/server/am/ProcessRecord;Landroid/app/ApplicationErrorReport$CrashInfo;)V

    .line 57
    .local v0, "d":Landroid/app/Dialog;
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 58
    iput-object v0, v4, Lcom/android/server/am/ProcessRecord;->crashDialog:Landroid/app/Dialog;

    .end local v0    # "d":Landroid/app/Dialog;
    :goto_1
    move v1, v6

    .line 65
    goto :goto_0

    .line 63
    :cond_1
    invoke-virtual {v3, v1}, Lcom/android/server/am/AppErrorResult;->set(I)V

    goto :goto_1
.end method

.method static showMiuiAppCrashDialog(Lcom/android/server/am/ActivityManagerService;Ljava/util/HashMap;Landroid/content/Context;Lcom/android/server/am/ProcessRecord;Lcom/android/server/am/AppErrorResult;)V
    .locals 2
    .param p0, "ams"    # Lcom/android/server/am/ActivityManagerService;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "proc"    # Lcom/android/server/am/ProcessRecord;
    .param p4, "res"    # Lcom/android/server/am/AppErrorResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/server/am/ActivityManagerService;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Landroid/content/Context;",
            "Lcom/android/server/am/ProcessRecord;",
            "Lcom/android/server/am/AppErrorResult;",
            ")V"
        }
    .end annotation

    .prologue
    .line 101
    .local p1, "data":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {p0, p1}, Lcom/android/server/am/ActivityManagerServiceInjector;->showAppCrashDialog(Lcom/android/server/am/ActivityManagerService;Ljava/util/HashMap;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 102
    new-instance v0, Lcom/android/server/am/AppErrorDialog;

    invoke-direct {v0, p2, p0, p4, p3}, Lcom/android/server/am/AppErrorDialog;-><init>(Landroid/content/Context;Lcom/android/server/am/ActivityManagerService;Lcom/android/server/am/AppErrorResult;Lcom/android/server/am/ProcessRecord;)V

    .line 103
    .local v0, "d":Landroid/app/Dialog;
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 104
    iput-object v0, p3, Lcom/android/server/am/ProcessRecord;->crashDialog:Landroid/app/Dialog;

    .line 106
    .end local v0    # "d":Landroid/app/Dialog;
    :cond_0
    return-void
.end method
