.class Lcom/android/server/accounts/AccountManagerServiceInjector;
.super Ljava/lang/Object;
.source "AccountManagerServiceInjector.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static isTrustedAccountSignature(Landroid/content/pm/PackageManager;Ljava/lang/String;II)Z
    .locals 1
    .param p0, "pm"    # Landroid/content/pm/PackageManager;
    .param p1, "accountType"    # Ljava/lang/String;
    .param p2, "serviceUid"    # I
    .param p3, "callingUid"    # I

    .prologue
    .line 10
    invoke-static {p0, p1, p2, p3}, Lmiui/content/pm/ExtraPackageManager;->isTrustedAccountSignature(Landroid/content/pm/PackageManager;Ljava/lang/String;II)Z

    move-result v0

    return v0
.end method
