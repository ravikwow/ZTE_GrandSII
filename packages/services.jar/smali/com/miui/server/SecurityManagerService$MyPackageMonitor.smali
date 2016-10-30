.class Lcom/miui/server/SecurityManagerService$MyPackageMonitor;
.super Lcom/android/internal/content/PackageMonitor;
.source "SecurityManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/server/SecurityManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyPackageMonitor"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/server/SecurityManagerService;


# direct methods
.method constructor <init>(Lcom/miui/server/SecurityManagerService;)V
    .locals 0

    .prologue
    .line 134
    iput-object p1, p0, Lcom/miui/server/SecurityManagerService$MyPackageMonitor;->this$0:Lcom/miui/server/SecurityManagerService;

    invoke-direct {p0}, Lcom/android/internal/content/PackageMonitor;-><init>()V

    return-void
.end method


# virtual methods
.method public onPackageAdded(Ljava/lang/String;I)V
    .locals 0
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "uid"    # I

    .prologue
    .line 137
    return-void
.end method

.method public onPackageRemoved(Ljava/lang/String;I)V
    .locals 1
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "uid"    # I

    .prologue
    .line 140
    iget-object v0, p0, Lcom/miui/server/SecurityManagerService$MyPackageMonitor;->this$0:Lcom/miui/server/SecurityManagerService;

    # invokes: Lcom/miui/server/SecurityManagerService;->removePackage(Ljava/lang/String;)V
    invoke-static {v0, p1}, Lcom/miui/server/SecurityManagerService;->access$300(Lcom/miui/server/SecurityManagerService;Ljava/lang/String;)V

    .line 141
    return-void
.end method

.method public onPackagesAvailable([Ljava/lang/String;)V
    .locals 0
    .param p1, "packages"    # [Ljava/lang/String;

    .prologue
    .line 144
    return-void
.end method

.method public onPackagesUnavailable([Ljava/lang/String;)V
    .locals 0
    .param p1, "packages"    # [Ljava/lang/String;

    .prologue
    .line 147
    return-void
.end method
