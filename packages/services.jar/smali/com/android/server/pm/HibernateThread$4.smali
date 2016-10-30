.class Lcom/android/server/pm/HibernateThread$4;
.super Ljava/lang/Object;
.source "HibernateThread.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/pm/HibernateThread;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/pm/HibernateThread;


# direct methods
.method constructor <init>(Lcom/android/server/pm/HibernateThread;)V
    .locals 0

    .prologue
    .line 379
    iput-object p1, p0, Lcom/android/server/pm/HibernateThread$4;->this$0:Lcom/android/server/pm/HibernateThread;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v3, 0x0

    .line 382
    const-string v2, "persist.sys.quickboot"

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 383
    .local v0, "quickbootVal":I
    const-string v2, "service.quickboot.state"

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 384
    .local v1, "quickboot_state":I
    const-string v2, "HibernateThread"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "quickbootVal = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", quickboot_state = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 385
    if-ne v0, v5, :cond_0

    if-ne v1, v5, :cond_0

    .line 386
    const-string v2, "sys.usb.config"

    const-string v3, "charge_only"

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 387
    # getter for: Lcom/android/server/pm/HibernateThread;->mStorageManager:Landroid/os/storage/StorageManager;
    invoke-static {}, Lcom/android/server/pm/HibernateThread;->access$100()Landroid/os/storage/StorageManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/storage/StorageManager;->disableUsbMassStorage()V

    .line 388
    const-string v2, "chargerQuickboot"

    invoke-static {v2}, Landroid/os/SystemService;->isRunning(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 389
    const-string v2, "chargerQuickboot"

    invoke-static {v2}, Landroid/os/SystemService;->start(Ljava/lang/String;)V

    .line 390
    const-string v2, "HibernateThread"

    const-string v3, "quickboot start chargerQuickboot hibernate."

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 395
    :cond_0
    :goto_0
    return-void

    .line 392
    :cond_1
    const-string v2, "HibernateThread"

    const-string v3, "quickboot chargerQuickboot is running hibernate!"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
