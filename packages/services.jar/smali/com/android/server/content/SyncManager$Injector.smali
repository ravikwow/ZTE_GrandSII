.class Lcom/android/server/content/SyncManager$Injector;
.super Ljava/lang/Object;
.source "SyncManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/content/SyncManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Injector"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 2947
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static registerWifiOnlyReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "receiver"    # Landroid/content/BroadcastReceiver;

    .prologue
    .line 2951
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "com.miui.action.SYNC_ON_WIFI_ONLY_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 2953
    return-void
.end method

.method static removeIgnoreSettingsFlag(Lcom/android/server/content/SyncOperation;)V
    .locals 2
    .param p0, "operation"    # Lcom/android/server/content/SyncOperation;

    .prologue
    .line 2956
    iget-object v0, p0, Lcom/android/server/content/SyncOperation;->extras:Landroid/os/Bundle;

    const-string v1, "ignore_settings"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 2958
    const-string v0, "SyncManager"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2959
    const-string v0, "SyncManager"

    const-string v1, "ignore settings flag removed"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2961
    :cond_0
    return-void
.end method
