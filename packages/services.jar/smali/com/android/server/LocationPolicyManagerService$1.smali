.class Lcom/android/server/LocationPolicyManagerService$1;
.super Landroid/app/IProcessObserver$Stub;
.source "LocationPolicyManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/LocationPolicyManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/LocationPolicyManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/LocationPolicyManagerService;)V
    .locals 0

    .prologue
    .line 246
    iput-object p1, p0, Lcom/android/server/LocationPolicyManagerService$1;->this$0:Lcom/android/server/LocationPolicyManagerService;

    invoke-direct {p0}, Landroid/app/IProcessObserver$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public onForegroundActivitiesChanged(IIZ)V
    .locals 3
    .param p1, "pid"    # I
    .param p2, "uid"    # I
    .param p3, "foregroundActivities"    # Z

    .prologue
    .line 249
    const-string v1, "LocationPolicy"

    const-string v2, "onForegroundActivitiesChanged"

    invoke-static {v1, v2}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    iget-object v1, p0, Lcom/android/server/LocationPolicyManagerService$1;->this$0:Lcom/android/server/LocationPolicyManagerService;

    # getter for: Lcom/android/server/LocationPolicyManagerService;->mRulesLock:Ljava/lang/Object;
    invoke-static {v1}, Lcom/android/server/LocationPolicyManagerService;->access$000(Lcom/android/server/LocationPolicyManagerService;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    .line 255
    :try_start_0
    iget-object v1, p0, Lcom/android/server/LocationPolicyManagerService$1;->this$0:Lcom/android/server/LocationPolicyManagerService;

    # getter for: Lcom/android/server/LocationPolicyManagerService;->mUidPidForeground:Landroid/util/SparseArray;
    invoke-static {v1}, Lcom/android/server/LocationPolicyManagerService;->access$100(Lcom/android/server/LocationPolicyManagerService;)Landroid/util/SparseArray;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/SparseBooleanArray;

    .line 256
    .local v0, "pidForeground":Landroid/util/SparseBooleanArray;
    if-nez v0, :cond_0

    .line 257
    new-instance v0, Landroid/util/SparseBooleanArray;

    .end local v0    # "pidForeground":Landroid/util/SparseBooleanArray;
    const/4 v1, 0x2

    invoke-direct {v0, v1}, Landroid/util/SparseBooleanArray;-><init>(I)V

    .line 258
    .restart local v0    # "pidForeground":Landroid/util/SparseBooleanArray;
    iget-object v1, p0, Lcom/android/server/LocationPolicyManagerService$1;->this$0:Lcom/android/server/LocationPolicyManagerService;

    # getter for: Lcom/android/server/LocationPolicyManagerService;->mUidPidForeground:Landroid/util/SparseArray;
    invoke-static {v1}, Lcom/android/server/LocationPolicyManagerService;->access$100(Lcom/android/server/LocationPolicyManagerService;)Landroid/util/SparseArray;

    move-result-object v1

    invoke-virtual {v1, p2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 260
    :cond_0
    invoke-virtual {v0, p1, p3}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 261
    iget-object v1, p0, Lcom/android/server/LocationPolicyManagerService$1;->this$0:Lcom/android/server/LocationPolicyManagerService;

    # invokes: Lcom/android/server/LocationPolicyManagerService;->computeUidForegroundLocked(I)V
    invoke-static {v1, p2}, Lcom/android/server/LocationPolicyManagerService;->access$200(Lcom/android/server/LocationPolicyManagerService;I)V

    .line 262
    monitor-exit v2

    .line 263
    return-void

    .line 262
    .end local v0    # "pidForeground":Landroid/util/SparseBooleanArray;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onImportanceChanged(III)V
    .locals 0
    .param p1, "pid"    # I
    .param p2, "uid"    # I
    .param p3, "importance"    # I

    .prologue
    .line 277
    return-void
.end method

.method public onProcessDied(II)V
    .locals 3
    .param p1, "pid"    # I
    .param p2, "uid"    # I

    .prologue
    .line 266
    iget-object v1, p0, Lcom/android/server/LocationPolicyManagerService$1;->this$0:Lcom/android/server/LocationPolicyManagerService;

    # getter for: Lcom/android/server/LocationPolicyManagerService;->mRulesLock:Ljava/lang/Object;
    invoke-static {v1}, Lcom/android/server/LocationPolicyManagerService;->access$000(Lcom/android/server/LocationPolicyManagerService;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    .line 268
    :try_start_0
    iget-object v1, p0, Lcom/android/server/LocationPolicyManagerService$1;->this$0:Lcom/android/server/LocationPolicyManagerService;

    # getter for: Lcom/android/server/LocationPolicyManagerService;->mUidPidForeground:Landroid/util/SparseArray;
    invoke-static {v1}, Lcom/android/server/LocationPolicyManagerService;->access$100(Lcom/android/server/LocationPolicyManagerService;)Landroid/util/SparseArray;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/SparseBooleanArray;

    .line 269
    .local v0, "pidForeground":Landroid/util/SparseBooleanArray;
    if-eqz v0, :cond_0

    .line 270
    invoke-virtual {v0, p1}, Landroid/util/SparseBooleanArray;->delete(I)V

    .line 271
    iget-object v1, p0, Lcom/android/server/LocationPolicyManagerService$1;->this$0:Lcom/android/server/LocationPolicyManagerService;

    # invokes: Lcom/android/server/LocationPolicyManagerService;->computeUidForegroundLocked(I)V
    invoke-static {v1, p2}, Lcom/android/server/LocationPolicyManagerService;->access$200(Lcom/android/server/LocationPolicyManagerService;I)V

    .line 273
    :cond_0
    monitor-exit v2

    .line 274
    return-void

    .line 273
    .end local v0    # "pidForeground":Landroid/util/SparseBooleanArray;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
