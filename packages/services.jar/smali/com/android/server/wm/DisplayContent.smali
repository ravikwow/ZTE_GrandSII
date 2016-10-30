.class Lcom/android/server/wm/DisplayContent;
.super Ljava/lang/Object;
.source "DisplayContent.java"


# instance fields
.field final isDefaultDisplay:Z

.field layoutNeeded:Z

.field mBaseDisplayDensity:I

.field mBaseDisplayHeight:I

.field mBaseDisplayRect:Landroid/graphics/Rect;

.field mBaseDisplayWidth:I

.field mConfiguration:Landroid/content/res/Configuration;

.field mCurrentFocus:Lcom/android/server/wm/WindowState;

.field private final mDisplay:Landroid/view/Display;

.field private final mDisplayId:I

.field private final mDisplayInfo:Landroid/view/DisplayInfo;

.field final mDisplaySizeLock:Ljava/lang/Object;

.field final mExitingAppTokens:Lcom/android/server/wm/AppTokenList;

.field final mExitingTokens:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/wm/WindowToken;",
            ">;"
        }
    .end annotation
.end field

.field mFocusedApp:Lcom/android/server/wm/AppWindowToken;

.field private mHomeStack:Lcom/android/server/wm/TaskStack;

.field mInitialDisplayDensity:I

.field mInitialDisplayHeight:I

.field mInitialDisplayWidth:I

.field mInputFocus:Lcom/android/server/wm/WindowState;

.field mInputMethodTarget:Lcom/android/server/wm/WindowState;

.field mInputMethodTargetWaitingAnim:Z

.field mInputMethodWindow:Lcom/android/server/wm/WindowState;

.field mLastFocus:Lcom/android/server/wm/WindowState;

.field final mService:Lcom/android/server/wm/WindowManagerService;

.field mStackBoxes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/wm/StackBox;",
            ">;"
        }
    .end annotation
.end field

.field mTapDetector:Lcom/android/server/wm/StackTapPointerEventListener;

.field private mTaskHistory:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/wm/Task;",
            ">;"
        }
    .end annotation
.end field

.field mTmpRect:Landroid/graphics/Rect;

.field mTouchExcludeRegion:Landroid/graphics/Region;

.field private mWindows:Lcom/android/server/wm/WindowList;

.field pendingLayoutChanges:I

.field sCurrentBoxId:I


# direct methods
.method constructor <init>(Landroid/view/Display;Lcom/android/server/wm/WindowManagerService;)V
    .locals 5
    .param p1, "display"    # Landroid/view/Display;
    .param p2, "service"    # Lcom/android/server/wm/WindowManagerService;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    new-instance v2, Lcom/android/server/wm/WindowList;

    invoke-direct {v2}, Lcom/android/server/wm/WindowList;-><init>()V

    iput-object v2, p0, Lcom/android/server/wm/DisplayContent;->mWindows:Lcom/android/server/wm/WindowList;

    .line 71
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/android/server/wm/DisplayContent;->mDisplaySizeLock:Ljava/lang/Object;

    .line 72
    iput v3, p0, Lcom/android/server/wm/DisplayContent;->mInitialDisplayWidth:I

    .line 73
    iput v3, p0, Lcom/android/server/wm/DisplayContent;->mInitialDisplayHeight:I

    .line 74
    iput v3, p0, Lcom/android/server/wm/DisplayContent;->mInitialDisplayDensity:I

    .line 75
    iput v3, p0, Lcom/android/server/wm/DisplayContent;->mBaseDisplayWidth:I

    .line 76
    iput v3, p0, Lcom/android/server/wm/DisplayContent;->mBaseDisplayHeight:I

    .line 77
    iput v3, p0, Lcom/android/server/wm/DisplayContent;->mBaseDisplayDensity:I

    .line 78
    new-instance v2, Landroid/view/DisplayInfo;

    invoke-direct {v2}, Landroid/view/DisplayInfo;-><init>()V

    iput-object v2, p0, Lcom/android/server/wm/DisplayContent;->mDisplayInfo:Landroid/view/DisplayInfo;

    .line 81
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/android/server/wm/DisplayContent;->mBaseDisplayRect:Landroid/graphics/Rect;

    .line 92
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/server/wm/DisplayContent;->mExitingTokens:Ljava/util/ArrayList;

    .line 98
    new-instance v2, Lcom/android/server/wm/AppTokenList;

    invoke-direct {v2}, Lcom/android/server/wm/AppTokenList;-><init>()V

    iput-object v2, p0, Lcom/android/server/wm/DisplayContent;->mExitingAppTokens:Lcom/android/server/wm/AppTokenList;

    .line 103
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    .line 104
    iput v3, p0, Lcom/android/server/wm/DisplayContent;->sCurrentBoxId:I

    .line 106
    iput-object v4, p0, Lcom/android/server/wm/DisplayContent;->mInputMethodWindow:Lcom/android/server/wm/WindowState;

    .line 109
    iput-object v4, p0, Lcom/android/server/wm/DisplayContent;->mInputMethodTarget:Lcom/android/server/wm/WindowState;

    .line 114
    iput-object v4, p0, Lcom/android/server/wm/DisplayContent;->mFocusedApp:Lcom/android/server/wm/AppWindowToken;

    .line 115
    iput-object v4, p0, Lcom/android/server/wm/DisplayContent;->mCurrentFocus:Lcom/android/server/wm/WindowState;

    .line 116
    iput-object v4, p0, Lcom/android/server/wm/DisplayContent;->mLastFocus:Lcom/android/server/wm/WindowState;

    .line 117
    iput-object v4, p0, Lcom/android/server/wm/DisplayContent;->mConfiguration:Landroid/content/res/Configuration;

    .line 118
    iput-object v4, p0, Lcom/android/server/wm/DisplayContent;->mInputFocus:Lcom/android/server/wm/WindowState;

    .line 122
    iput-object v4, p0, Lcom/android/server/wm/DisplayContent;->mHomeStack:Lcom/android/server/wm/TaskStack;

    .line 128
    new-instance v2, Landroid/graphics/Region;

    invoke-direct {v2}, Landroid/graphics/Region;-><init>()V

    iput-object v2, p0, Lcom/android/server/wm/DisplayContent;->mTouchExcludeRegion:Landroid/graphics/Region;

    .line 131
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/server/wm/DisplayContent;->mTaskHistory:Ljava/util/ArrayList;

    .line 134
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/android/server/wm/DisplayContent;->mTmpRect:Landroid/graphics/Rect;

    .line 143
    iput-object p1, p0, Lcom/android/server/wm/DisplayContent;->mDisplay:Landroid/view/Display;

    .line 144
    invoke-virtual {p1}, Landroid/view/Display;->getDisplayId()I

    move-result v2

    iput v2, p0, Lcom/android/server/wm/DisplayContent;->mDisplayId:I

    .line 145
    iget-object v2, p0, Lcom/android/server/wm/DisplayContent;->mDisplayInfo:Landroid/view/DisplayInfo;

    invoke-virtual {p1, v2}, Landroid/view/Display;->getDisplayInfo(Landroid/view/DisplayInfo;)Z

    .line 146
    iget v2, p0, Lcom/android/server/wm/DisplayContent;->mDisplayId:I

    if-nez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    iput-boolean v2, p0, Lcom/android/server/wm/DisplayContent;->isDefaultDisplay:Z

    .line 147
    iput-object p2, p0, Lcom/android/server/wm/DisplayContent;->mService:Lcom/android/server/wm/WindowManagerService;

    .line 149
    new-instance v0, Lcom/android/server/wm/StackBox;

    invoke-direct {v0, p2, p0, v4}, Lcom/android/server/wm/StackBox;-><init>(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/DisplayContent;Lcom/android/server/wm/StackBox;)V

    .line 150
    .local v0, "newBox":Lcom/android/server/wm/StackBox;
    iget-object v2, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 151
    new-instance v1, Lcom/android/server/wm/TaskStack;

    invoke-direct {v1, p2, v3, p0}, Lcom/android/server/wm/TaskStack;-><init>(Lcom/android/server/wm/WindowManagerService;ILcom/android/server/wm/DisplayContent;)V

    .line 152
    .local v1, "newStack":Lcom/android/server/wm/TaskStack;
    iput-object v0, v1, Lcom/android/server/wm/TaskStack;->mStackBox:Lcom/android/server/wm/StackBox;

    .line 153
    iput-object v1, v0, Lcom/android/server/wm/StackBox;->mStack:Lcom/android/server/wm/TaskStack;

    .line 154
    iput-object v1, p0, Lcom/android/server/wm/DisplayContent;->mHomeStack:Lcom/android/server/wm/TaskStack;

    .line 155
    return-void

    .end local v0    # "newBox":Lcom/android/server/wm/StackBox;
    .end local v1    # "newStack":Lcom/android/server/wm/TaskStack;
    :cond_0
    move v2, v3

    .line 146
    goto :goto_0
.end method


# virtual methods
.method addStackBox(Lcom/android/server/wm/StackBox;Z)V
    .locals 2
    .param p1, "box"    # Lcom/android/server/wm/StackBox;
    .param p2, "toTop"    # Z

    .prologue
    .line 325
    iget-object v1, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_0
    invoke-virtual {v1, v0, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 326
    return-void

    .line 325
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method addTask(Lcom/android/server/wm/Task;Z)V
    .locals 8
    .param p1, "task"    # Lcom/android/server/wm/Task;
    .param p2, "toTop"    # Z

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 197
    iget-object v3, p0, Lcom/android/server/wm/DisplayContent;->mTaskHistory:Ljava/util/ArrayList;

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 199
    iget v2, p1, Lcom/android/server/wm/Task;->mUserId:I

    .line 201
    .local v2, "userId":I
    iget-object v3, p0, Lcom/android/server/wm/DisplayContent;->mTaskHistory:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 202
    .local v0, "numTasks":I
    if-eqz p2, :cond_3

    .line 203
    add-int/lit8 v1, v0, -0x1

    .local v1, "taskNdx":I
    :goto_0
    if-ltz v1, :cond_0

    .line 204
    iget-object v3, p0, Lcom/android/server/wm/DisplayContent;->mTaskHistory:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/wm/Task;

    iget v3, v3, Lcom/android/server/wm/Task;->mUserId:I

    if-ne v3, v2, :cond_2

    .line 208
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 217
    :cond_1
    iget-object v3, p0, Lcom/android/server/wm/DisplayContent;->mTaskHistory:Ljava/util/ArrayList;

    invoke-virtual {v3, v1, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 218
    const/16 v6, 0x791a

    const/4 v3, 0x3

    new-array v7, v3, [Ljava/lang/Object;

    iget v3, p1, Lcom/android/server/wm/Task;->taskId:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v7, v5

    if-eqz p2, :cond_4

    move v3, v4

    :goto_1
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v7, v4

    const/4 v3, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v7, v3

    invoke-static {v6, v7}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 219
    return-void

    .line 203
    :cond_2
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 210
    .end local v1    # "taskNdx":I
    :cond_3
    const/4 v1, 0x0

    .restart local v1    # "taskNdx":I
    :goto_2
    if-ge v1, v0, :cond_1

    .line 211
    iget-object v3, p0, Lcom/android/server/wm/DisplayContent;->mTaskHistory:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/wm/Task;

    iget v3, v3, Lcom/android/server/wm/Task;->mUserId:I

    if-eq v3, v2, :cond_1

    .line 210
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_4
    move v3, v5

    .line 218
    goto :goto_1
.end method

.method animateDimLayers()Z
    .locals 3

    .prologue
    .line 463
    const/4 v0, 0x0

    .line 464
    .local v0, "result":Z
    iget-object v2, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, "stackBoxNdx":I
    :goto_0
    if-ltz v1, :cond_0

    .line 465
    iget-object v2, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/wm/StackBox;

    invoke-virtual {v2}, Lcom/android/server/wm/StackBox;->animateDimLayers()Z

    move-result v2

    or-int/2addr v0, v2

    .line 464
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 467
    :cond_0
    return v0
.end method

.method close()V
    .locals 2

    .prologue
    .line 491
    iget-object v1, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .local v0, "stackBoxNdx":I
    :goto_0
    if-ltz v0, :cond_0

    .line 492
    iget-object v1, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/wm/StackBox;

    invoke-virtual {v1}, Lcom/android/server/wm/StackBox;->close()V

    .line 491
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 494
    :cond_0
    return-void
.end method

.method createStack(IIIF)Lcom/android/server/wm/TaskStack;
    .locals 16
    .param p1, "stackId"    # I
    .param p2, "relativeStackBoxId"    # I
    .param p3, "position"    # I
    .param p4, "weight"    # F

    .prologue
    .line 254
    const/4 v6, 0x0

    .line 257
    .local v6, "newStack":Lcom/android/server/wm/TaskStack;
    if-nez p1, :cond_3

    .line 258
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    const/4 v10, 0x1

    if-eq v9, v10, :cond_0

    .line 259
    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string v10, "createStack: HOME_STACK_ID (0) not first."

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 261
    :cond_0
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/server/wm/DisplayContent;->mHomeStack:Lcom/android/server/wm/TaskStack;

    .line 299
    :cond_1
    if-eqz v6, :cond_2

    .line 300
    const/4 v9, 0x1

    move-object/from16 v0, p0

    iput-boolean v9, v0, Lcom/android/server/wm/DisplayContent;->layoutNeeded:Z

    .line 302
    :cond_2
    const/16 v9, 0x791c

    const/4 v10, 0x4

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x1

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x2

    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x3

    const/high16 v12, 0x42c80000    # 100.0f

    mul-float v12, v12, p4

    float-to-double v12, v12

    const-wide/high16 v14, 0x3fe0000000000000L    # 0.5

    add-double/2addr v12, v14

    double-to-int v12, v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-static {v9, v10}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 304
    return-object v6

    .line 264
    :cond_3
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    add-int/lit8 v8, v9, -0x1

    .local v8, "stackBoxNdx":I
    :goto_0
    if-ltz v8, :cond_5

    .line 265
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/server/wm/StackBox;

    .line 266
    .local v4, "box":Lcom/android/server/wm/StackBox;
    const/4 v9, 0x6

    move/from16 v0, p3

    if-eq v0, v9, :cond_4

    const/4 v9, 0x7

    move/from16 v0, p3

    if-ne v0, v9, :cond_7

    .line 269
    :cond_4
    move/from16 v0, p2

    invoke-virtual {v4, v0}, Lcom/android/server/wm/StackBox;->contains(I)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 270
    new-instance v5, Lcom/android/server/wm/StackBox;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/wm/DisplayContent;->mService:Lcom/android/server/wm/WindowManagerService;

    const/4 v10, 0x0

    move-object/from16 v0, p0

    invoke-direct {v5, v9, v0, v10}, Lcom/android/server/wm/StackBox;-><init>(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/DisplayContent;Lcom/android/server/wm/StackBox;)V

    .line 271
    .local v5, "newBox":Lcom/android/server/wm/StackBox;
    new-instance v6, Lcom/android/server/wm/TaskStack;

    .end local v6    # "newStack":Lcom/android/server/wm/TaskStack;
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/wm/DisplayContent;->mService:Lcom/android/server/wm/WindowManagerService;

    move/from16 v0, p1

    move-object/from16 v1, p0

    invoke-direct {v6, v9, v0, v1}, Lcom/android/server/wm/TaskStack;-><init>(Lcom/android/server/wm/WindowManagerService;ILcom/android/server/wm/DisplayContent;)V

    .line 272
    .restart local v6    # "newStack":Lcom/android/server/wm/TaskStack;
    iput-object v5, v6, Lcom/android/server/wm/TaskStack;->mStackBox:Lcom/android/server/wm/StackBox;

    .line 273
    iput-object v6, v5, Lcom/android/server/wm/StackBox;->mStack:Lcom/android/server/wm/TaskStack;

    .line 274
    const/4 v9, 0x6

    move/from16 v0, p3

    if-ne v0, v9, :cond_6

    const/4 v7, 0x1

    .line 277
    .local v7, "offset":I
    :goto_1
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    add-int v10, v8, v7

    invoke-virtual {v9, v10, v5}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 279
    sget-boolean v9, Landroid/util/PowerMoConfig;->WITHOUT_ALL:Z

    if-nez v9, :cond_5

    .line 280
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/wm/DisplayContent;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v9, v9, Lcom/android/server/wm/WindowManagerService;->mWmsFuncs:Lcom/android/server/wm/IWmSmartShowFuncs;

    invoke-virtual/range {p0 .. p0}, Lcom/android/server/wm/DisplayContent;->getDisplayId()I

    move-result v10

    iget v11, v6, Lcom/android/server/wm/TaskStack;->mStackId:I

    iget v12, v5, Lcom/android/server/wm/StackBox;->mStackBoxId:I

    invoke-interface {v9, v10, v11, v12}, Lcom/android/server/wm/IWmSmartShowFuncs;->stackBoxCreatedLw(III)V

    .line 294
    .end local v4    # "box":Lcom/android/server/wm/StackBox;
    .end local v5    # "newBox":Lcom/android/server/wm/StackBox;
    .end local v7    # "offset":I
    :cond_5
    if-gez v8, :cond_1

    .line 295
    new-instance v9, Ljava/lang/IllegalArgumentException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "createStack: stackBoxId "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move/from16 v0, p2

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " not found."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 274
    .restart local v4    # "box":Lcom/android/server/wm/StackBox;
    .restart local v5    # "newBox":Lcom/android/server/wm/StackBox;
    :cond_6
    const/4 v7, 0x0

    goto :goto_1

    .line 288
    .end local v5    # "newBox":Lcom/android/server/wm/StackBox;
    :cond_7
    move/from16 v0, p1

    move/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    invoke-virtual {v4, v0, v1, v2, v3}, Lcom/android/server/wm/StackBox;->split(IIIF)Lcom/android/server/wm/TaskStack;

    move-result-object v6

    .line 289
    if-nez v6, :cond_5

    .line 264
    :cond_8
    add-int/lit8 v8, v8, -0x1

    goto/16 :goto_0
.end method

.method public dump(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 13
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "pw"    # Ljava/io/PrintWriter;

    .prologue
    .line 497
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v10, "Display: mDisplayId="

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v10, p0, Lcom/android/server/wm/DisplayContent;->mDisplayId:I

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->println(I)V

    .line 499
    sget-boolean v10, Landroid/util/PowerMoConfig;->WITHOUT_REMOTE_DISPLAY:Z

    if-nez v10, :cond_3

    .line 500
    iget v10, p0, Lcom/android/server/wm/DisplayContent;->mDisplayId:I

    if-lez v10, :cond_0

    .line 501
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v10, "mConfiguration="

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/android/server/wm/DisplayContent;->mConfiguration:Landroid/content/res/Configuration;

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 503
    :cond_0
    const-string v10, "  mCurrentFocus="

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/android/server/wm/DisplayContent;->mCurrentFocus:Lcom/android/server/wm/WindowState;

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 504
    iget-object v10, p0, Lcom/android/server/wm/DisplayContent;->mLastFocus:Lcom/android/server/wm/WindowState;

    iget-object v11, p0, Lcom/android/server/wm/DisplayContent;->mCurrentFocus:Lcom/android/server/wm/WindowState;

    if-eq v10, v11, :cond_1

    .line 505
    const-string v10, "  mLastFocus="

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/android/server/wm/DisplayContent;->mLastFocus:Lcom/android/server/wm/WindowState;

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 507
    :cond_1
    iget-object v10, p0, Lcom/android/server/wm/DisplayContent;->mInputFocus:Lcom/android/server/wm/WindowState;

    iget-object v11, p0, Lcom/android/server/wm/DisplayContent;->mCurrentFocus:Lcom/android/server/wm/WindowState;

    if-eq v10, v11, :cond_2

    .line 508
    const-string v10, "  mInputFocus="

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/android/server/wm/DisplayContent;->mInputFocus:Lcom/android/server/wm/WindowState;

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 510
    :cond_2
    const-string v10, "  mFocusedApp="

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/android/server/wm/DisplayContent;->mFocusedApp:Lcom/android/server/wm/AppWindowToken;

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 511
    const-string v10, "  mInputMethodTarget="

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/android/server/wm/DisplayContent;->mInputMethodTarget:Lcom/android/server/wm/WindowState;

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 512
    const-string v10, "  mInputMethodWindow="

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/android/server/wm/DisplayContent;->mInputMethodWindow:Lcom/android/server/wm/WindowState;

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 515
    :cond_3
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "  "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 516
    .local v4, "subPrefix":Ljava/lang/String;
    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v10, "init="

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v10, p0, Lcom/android/server/wm/DisplayContent;->mInitialDisplayWidth:I

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(I)V

    const-string v10, "x"

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 517
    iget v10, p0, Lcom/android/server/wm/DisplayContent;->mInitialDisplayHeight:I

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(I)V

    const-string v10, " "

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v10, p0, Lcom/android/server/wm/DisplayContent;->mInitialDisplayDensity:I

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(I)V

    .line 518
    const-string v10, "dpi"

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 519
    iget v10, p0, Lcom/android/server/wm/DisplayContent;->mInitialDisplayWidth:I

    iget v11, p0, Lcom/android/server/wm/DisplayContent;->mBaseDisplayWidth:I

    if-ne v10, v11, :cond_4

    iget v10, p0, Lcom/android/server/wm/DisplayContent;->mInitialDisplayHeight:I

    iget v11, p0, Lcom/android/server/wm/DisplayContent;->mBaseDisplayHeight:I

    if-ne v10, v11, :cond_4

    iget v10, p0, Lcom/android/server/wm/DisplayContent;->mInitialDisplayDensity:I

    iget v11, p0, Lcom/android/server/wm/DisplayContent;->mBaseDisplayDensity:I

    if-eq v10, v11, :cond_5

    .line 522
    :cond_4
    const-string v10, " base="

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 523
    iget v10, p0, Lcom/android/server/wm/DisplayContent;->mBaseDisplayWidth:I

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(I)V

    const-string v10, "x"

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v10, p0, Lcom/android/server/wm/DisplayContent;->mBaseDisplayHeight:I

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(I)V

    .line 524
    const-string v10, " "

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v10, p0, Lcom/android/server/wm/DisplayContent;->mBaseDisplayDensity:I

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(I)V

    const-string v10, "dpi"

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 526
    :cond_5
    const-string v10, " cur="

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 527
    iget-object v10, p0, Lcom/android/server/wm/DisplayContent;->mDisplayInfo:Landroid/view/DisplayInfo;

    iget v10, v10, Landroid/view/DisplayInfo;->logicalWidth:I

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(I)V

    .line 528
    const-string v10, "x"

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/android/server/wm/DisplayContent;->mDisplayInfo:Landroid/view/DisplayInfo;

    iget v10, v10, Landroid/view/DisplayInfo;->logicalHeight:I

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(I)V

    .line 529
    const-string v10, " app="

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 530
    iget-object v10, p0, Lcom/android/server/wm/DisplayContent;->mDisplayInfo:Landroid/view/DisplayInfo;

    iget v10, v10, Landroid/view/DisplayInfo;->appWidth:I

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(I)V

    .line 531
    const-string v10, "x"

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/android/server/wm/DisplayContent;->mDisplayInfo:Landroid/view/DisplayInfo;

    iget v10, v10, Landroid/view/DisplayInfo;->appHeight:I

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(I)V

    .line 532
    const-string v10, " rng="

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/android/server/wm/DisplayContent;->mDisplayInfo:Landroid/view/DisplayInfo;

    iget v10, v10, Landroid/view/DisplayInfo;->smallestNominalAppWidth:I

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(I)V

    .line 533
    const-string v10, "x"

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/android/server/wm/DisplayContent;->mDisplayInfo:Landroid/view/DisplayInfo;

    iget v10, v10, Landroid/view/DisplayInfo;->smallestNominalAppHeight:I

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(I)V

    .line 534
    const-string v10, "-"

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/android/server/wm/DisplayContent;->mDisplayInfo:Landroid/view/DisplayInfo;

    iget v10, v10, Landroid/view/DisplayInfo;->largestNominalAppWidth:I

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(I)V

    .line 535
    const-string v10, "x"

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/android/server/wm/DisplayContent;->mDisplayInfo:Landroid/view/DisplayInfo;

    iget v10, v10, Landroid/view/DisplayInfo;->largestNominalAppHeight:I

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->println(I)V

    .line 536
    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v10, "layoutNeeded="

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v10, p0, Lcom/android/server/wm/DisplayContent;->layoutNeeded:Z

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->println(Z)V

    .line 537
    const/4 v0, 0x0

    .local v0, "boxNdx":I
    :goto_0
    iget-object v10, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-ge v0, v10, :cond_6

    .line 538
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v10, "StackBox #"

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(I)V

    .line 539
    iget-object v10, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/android/server/wm/StackBox;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "  "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11, p2}, Lcom/android/server/wm/StackBox;->dump(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 537
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 541
    :cond_6
    invoke-virtual {p0}, Lcom/android/server/wm/DisplayContent;->numTokens()I

    move-result v2

    .line 542
    .local v2, "ndx":I
    if-lez v2, :cond_8

    .line 543
    invoke-virtual {p2}, Ljava/io/PrintWriter;->println()V

    .line 544
    const-string v10, "  Application tokens in Z order:"

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 545
    invoke-virtual {p0}, Lcom/android/server/wm/DisplayContent;->getTasks()Ljava/util/ArrayList;

    .line 546
    iget-object v10, p0, Lcom/android/server/wm/DisplayContent;->mTaskHistory:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    add-int/lit8 v5, v10, -0x1

    .local v5, "taskNdx":I
    :goto_1
    if-ltz v5, :cond_8

    .line 547
    iget-object v10, p0, Lcom/android/server/wm/DisplayContent;->mTaskHistory:Ljava/util/ArrayList;

    invoke-virtual {v10, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/android/server/wm/Task;

    iget-object v8, v10, Lcom/android/server/wm/Task;->mAppTokens:Lcom/android/server/wm/AppTokenList;

    .line 548
    .local v8, "tokens":Lcom/android/server/wm/AppTokenList;
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v10

    add-int/lit8 v7, v10, -0x1

    .local v7, "tokenNdx":I
    move v3, v2

    .end local v2    # "ndx":I
    .local v3, "ndx":I
    :goto_2
    if-ltz v7, :cond_7

    .line 549
    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/server/wm/AppWindowToken;

    .line 550
    .local v9, "wtoken":Lcom/android/server/wm/AppWindowToken;
    const-string v10, "  App #"

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    add-int/lit8 v2, v3, -0x1

    .end local v3    # "ndx":I
    .restart local v2    # "ndx":I
    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(I)V

    .line 551
    const/16 v10, 0x20

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(C)V

    invoke-virtual {p2, v9}, Ljava/io/PrintWriter;->print(Ljava/lang/Object;)V

    const-string v10, ":"

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 552
    const-string v10, "    "

    invoke-virtual {v9, p2, v10}, Lcom/android/server/wm/AppWindowToken;->dump(Ljava/io/PrintWriter;Ljava/lang/String;)V

    .line 548
    add-int/lit8 v7, v7, -0x1

    move v3, v2

    .end local v2    # "ndx":I
    .restart local v3    # "ndx":I
    goto :goto_2

    .line 546
    .end local v9    # "wtoken":Lcom/android/server/wm/AppWindowToken;
    :cond_7
    add-int/lit8 v5, v5, -0x1

    move v2, v3

    .end local v3    # "ndx":I
    .restart local v2    # "ndx":I
    goto :goto_1

    .line 556
    .end local v5    # "taskNdx":I
    .end local v7    # "tokenNdx":I
    .end local v8    # "tokens":Lcom/android/server/wm/AppTokenList;
    :cond_8
    iget-object v10, p0, Lcom/android/server/wm/DisplayContent;->mExitingTokens:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-lez v10, :cond_9

    .line 557
    invoke-virtual {p2}, Ljava/io/PrintWriter;->println()V

    .line 558
    const-string v10, "  Exiting tokens:"

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 559
    iget-object v10, p0, Lcom/android/server/wm/DisplayContent;->mExitingTokens:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    add-int/lit8 v1, v10, -0x1

    .local v1, "i":I
    :goto_3
    if-ltz v1, :cond_9

    .line 560
    iget-object v10, p0, Lcom/android/server/wm/DisplayContent;->mExitingTokens:Ljava/util/ArrayList;

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/server/wm/WindowToken;

    .line 561
    .local v6, "token":Lcom/android/server/wm/WindowToken;
    const-string v10, "  Exiting #"

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(I)V

    .line 562
    const/16 v10, 0x20

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(C)V

    invoke-virtual {p2, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/Object;)V

    .line 563
    const/16 v10, 0x3a

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->println(C)V

    .line 564
    const-string v10, "    "

    invoke-virtual {v6, p2, v10}, Lcom/android/server/wm/WindowToken;->dump(Ljava/io/PrintWriter;Ljava/lang/String;)V

    .line 559
    add-int/lit8 v1, v1, -0x1

    goto :goto_3

    .line 567
    .end local v1    # "i":I
    .end local v6    # "token":Lcom/android/server/wm/WindowToken;
    :cond_9
    iget-object v10, p0, Lcom/android/server/wm/DisplayContent;->mExitingAppTokens:Lcom/android/server/wm/AppTokenList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-lez v10, :cond_a

    .line 568
    invoke-virtual {p2}, Ljava/io/PrintWriter;->println()V

    .line 569
    const-string v10, "  Exiting application tokens:"

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 570
    iget-object v10, p0, Lcom/android/server/wm/DisplayContent;->mExitingAppTokens:Lcom/android/server/wm/AppTokenList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    add-int/lit8 v1, v10, -0x1

    .restart local v1    # "i":I
    :goto_4
    if-ltz v1, :cond_a

    .line 571
    iget-object v10, p0, Lcom/android/server/wm/DisplayContent;->mExitingAppTokens:Lcom/android/server/wm/AppTokenList;

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/server/wm/WindowToken;

    .line 572
    .restart local v6    # "token":Lcom/android/server/wm/WindowToken;
    const-string v10, "  Exiting App #"

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(I)V

    .line 573
    const/16 v10, 0x20

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->print(C)V

    invoke-virtual {p2, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/Object;)V

    .line 574
    const/16 v10, 0x3a

    invoke-virtual {p2, v10}, Ljava/io/PrintWriter;->println(C)V

    .line 575
    const-string v10, "    "

    invoke-virtual {v6, p2, v10}, Lcom/android/server/wm/WindowToken;->dump(Ljava/io/PrintWriter;Ljava/lang/String;)V

    .line 570
    add-int/lit8 v1, v1, -0x1

    goto :goto_4

    .line 578
    .end local v1    # "i":I
    .end local v6    # "token":Lcom/android/server/wm/WindowToken;
    :cond_a
    invoke-virtual {p2}, Ljava/io/PrintWriter;->println()V

    .line 579
    return-void
.end method

.method getDisplay()Landroid/view/Display;
    .locals 1

    .prologue
    .line 166
    iget-object v0, p0, Lcom/android/server/wm/DisplayContent;->mDisplay:Landroid/view/Display;

    return-object v0
.end method

.method getDisplayId()I
    .locals 1

    .prologue
    .line 158
    iget v0, p0, Lcom/android/server/wm/DisplayContent;->mDisplayId:I

    return v0
.end method

.method getDisplayInfo()Landroid/view/DisplayInfo;
    .locals 1

    .prologue
    .line 170
    iget-object v0, p0, Lcom/android/server/wm/DisplayContent;->mDisplayInfo:Landroid/view/DisplayInfo;

    return-object v0
.end method

.method getHomeStack()Lcom/android/server/wm/TaskStack;
    .locals 1

    .prologue
    .line 226
    iget-object v0, p0, Lcom/android/server/wm/DisplayContent;->mHomeStack:Lcom/android/server/wm/TaskStack;

    return-object v0
.end method

.method getLogicalDisplayRect(Landroid/graphics/Rect;)V
    .locals 6
    .param p1, "out"    # Landroid/graphics/Rect;

    .prologue
    .line 234
    invoke-virtual {p0}, Lcom/android/server/wm/DisplayContent;->updateDisplayInfo()V

    .line 236
    iget-object v4, p0, Lcom/android/server/wm/DisplayContent;->mDisplayInfo:Landroid/view/DisplayInfo;

    iget v3, v4, Landroid/view/DisplayInfo;->logicalWidth:I

    .line 237
    .local v3, "width":I
    iget v4, p0, Lcom/android/server/wm/DisplayContent;->mBaseDisplayWidth:I

    sub-int/2addr v4, v3

    div-int/lit8 v1, v4, 0x2

    .line 238
    .local v1, "left":I
    iget-object v4, p0, Lcom/android/server/wm/DisplayContent;->mDisplayInfo:Landroid/view/DisplayInfo;

    iget v0, v4, Landroid/view/DisplayInfo;->logicalHeight:I

    .line 239
    .local v0, "height":I
    iget v4, p0, Lcom/android/server/wm/DisplayContent;->mBaseDisplayHeight:I

    sub-int/2addr v4, v0

    div-int/lit8 v2, v4, 0x2

    .line 240
    .local v2, "top":I
    add-int v4, v1, v3

    add-int v5, v2, v0

    invoke-virtual {p1, v1, v2, v4, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 241
    return-void
.end method

.method getStackBounds(I)Landroid/graphics/Rect;
    .locals 3
    .param p1, "stackId"    # I

    .prologue
    .line 411
    iget-object v2, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, "stackBoxNdx":I
    :goto_0
    if-ltz v1, :cond_1

    .line 412
    iget-object v2, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/wm/StackBox;

    invoke-virtual {v2, p1}, Lcom/android/server/wm/StackBox;->getStackBounds(I)Landroid/graphics/Rect;

    move-result-object v0

    .line 413
    .local v0, "bounds":Landroid/graphics/Rect;
    if-eqz v0, :cond_0

    .line 417
    .end local v0    # "bounds":Landroid/graphics/Rect;
    :goto_1
    return-object v0

    .line 411
    .restart local v0    # "bounds":Landroid/graphics/Rect;
    :cond_0
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 417
    .end local v0    # "bounds":Landroid/graphics/Rect;
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method getStackBoxInfo(Lcom/android/server/wm/StackBox;)Landroid/app/ActivityManager$StackBoxInfo;
    .locals 5
    .param p1, "box"    # Lcom/android/server/wm/StackBox;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 340
    new-instance v0, Landroid/app/ActivityManager$StackBoxInfo;

    invoke-direct {v0}, Landroid/app/ActivityManager$StackBoxInfo;-><init>()V

    .line 341
    .local v0, "info":Landroid/app/ActivityManager$StackBoxInfo;
    iget v1, p1, Lcom/android/server/wm/StackBox;->mStackBoxId:I

    iput v1, v0, Landroid/app/ActivityManager$StackBoxInfo;->stackBoxId:I

    .line 342
    iget v1, p1, Lcom/android/server/wm/StackBox;->mWeight:F

    iput v1, v0, Landroid/app/ActivityManager$StackBoxInfo;->weight:F

    .line 343
    iget-boolean v1, p1, Lcom/android/server/wm/StackBox;->mVertical:Z

    iput-boolean v1, v0, Landroid/app/ActivityManager$StackBoxInfo;->vertical:Z

    .line 344
    new-instance v1, Landroid/graphics/Rect;

    iget-object v2, p1, Lcom/android/server/wm/StackBox;->mBounds:Landroid/graphics/Rect;

    invoke-direct {v1, v2}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    iput-object v1, v0, Landroid/app/ActivityManager$StackBoxInfo;->bounds:Landroid/graphics/Rect;

    .line 346
    const/4 v1, 0x0

    iput-object v1, v0, Landroid/app/ActivityManager$StackBoxInfo;->parent:Landroid/app/ActivityManager$StackBoxInfo;

    .line 347
    iget-object v1, p1, Lcom/android/server/wm/StackBox;->mStack:Lcom/android/server/wm/TaskStack;

    if-eqz v1, :cond_0

    .line 348
    iget-object v1, p1, Lcom/android/server/wm/StackBox;->mStack:Lcom/android/server/wm/TaskStack;

    iget v1, v1, Lcom/android/server/wm/TaskStack;->mStackId:I

    iput v1, v0, Landroid/app/ActivityManager$StackBoxInfo;->stackId:I

    .line 359
    :goto_0
    return-object v0

    .line 351
    :cond_0
    const/4 v1, -0x1

    iput v1, v0, Landroid/app/ActivityManager$StackBoxInfo;->stackId:I

    .line 352
    const/4 v1, 0x2

    new-array v1, v1, [Landroid/app/ActivityManager$StackBoxInfo;

    iput-object v1, v0, Landroid/app/ActivityManager$StackBoxInfo;->children:[Landroid/app/ActivityManager$StackBoxInfo;

    .line 353
    iget-object v1, v0, Landroid/app/ActivityManager$StackBoxInfo;->children:[Landroid/app/ActivityManager$StackBoxInfo;

    iget-object v2, p1, Lcom/android/server/wm/StackBox;->mFirst:Lcom/android/server/wm/StackBox;

    invoke-virtual {p0, v2}, Lcom/android/server/wm/DisplayContent;->getStackBoxInfo(Lcom/android/server/wm/StackBox;)Landroid/app/ActivityManager$StackBoxInfo;

    move-result-object v2

    aput-object v2, v1, v3

    .line 354
    iget-object v1, v0, Landroid/app/ActivityManager$StackBoxInfo;->children:[Landroid/app/ActivityManager$StackBoxInfo;

    iget-object v2, p1, Lcom/android/server/wm/StackBox;->mSecond:Lcom/android/server/wm/StackBox;

    invoke-virtual {p0, v2}, Lcom/android/server/wm/DisplayContent;->getStackBoxInfo(Lcom/android/server/wm/StackBox;)Landroid/app/ActivityManager$StackBoxInfo;

    move-result-object v2

    aput-object v2, v1, v4

    .line 355
    iget-object v1, v0, Landroid/app/ActivityManager$StackBoxInfo;->children:[Landroid/app/ActivityManager$StackBoxInfo;

    aget-object v1, v1, v3

    iput-object v0, v1, Landroid/app/ActivityManager$StackBoxInfo;->parent:Landroid/app/ActivityManager$StackBoxInfo;

    .line 356
    iget-object v1, v0, Landroid/app/ActivityManager$StackBoxInfo;->children:[Landroid/app/ActivityManager$StackBoxInfo;

    aget-object v1, v1, v4

    iput-object v0, v1, Landroid/app/ActivityManager$StackBoxInfo;->parent:Landroid/app/ActivityManager$StackBoxInfo;

    goto :goto_0
.end method

.method getStackBoxInfos()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/ActivityManager$StackBoxInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 363
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 364
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/ActivityManager$StackBoxInfo;>;"
    iget-object v2, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, "stackBoxNdx":I
    :goto_0
    if-ltz v1, :cond_0

    .line 365
    iget-object v2, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/wm/StackBox;

    invoke-virtual {p0, v2}, Lcom/android/server/wm/DisplayContent;->getStackBoxInfo(Lcom/android/server/wm/StackBox;)Landroid/app/ActivityManager$StackBoxInfo;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 364
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 367
    :cond_0
    return-object v0
.end method

.method getTasks()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/wm/Task;",
            ">;"
        }
    .end annotation

    .prologue
    .line 193
    iget-object v0, p0, Lcom/android/server/wm/DisplayContent;->mTaskHistory:Ljava/util/ArrayList;

    return-object v0
.end method

.method getWindowList()Lcom/android/server/wm/WindowList;
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lcom/android/server/wm/DisplayContent;->mWindows:Lcom/android/server/wm/WindowList;

    return-object v0
.end method

.method public hasAccess(I)Z
    .locals 1
    .param p1, "uid"    # I

    .prologue
    .line 177
    iget-object v0, p0, Lcom/android/server/wm/DisplayContent;->mDisplay:Landroid/view/Display;

    invoke-virtual {v0, p1}, Landroid/view/Display;->hasAccess(I)Z

    move-result v0

    return v0
.end method

.method homeOnTop()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 181
    iget-object v0, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/wm/StackBox;

    iget-object v0, v0, Lcom/android/server/wm/StackBox;->mStack:Lcom/android/server/wm/TaskStack;

    iget-object v2, p0, Lcom/android/server/wm/DisplayContent;->mHomeStack:Lcom/android/server/wm/TaskStack;

    if-eq v0, v2, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method isDimming()Z
    .locals 3

    .prologue
    .line 477
    const/4 v0, 0x0

    .line 478
    .local v0, "result":Z
    iget-object v2, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, "stackBoxNdx":I
    :goto_0
    if-ltz v1, :cond_0

    .line 479
    iget-object v2, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/wm/StackBox;

    invoke-virtual {v2}, Lcom/android/server/wm/StackBox;->isDimming()Z

    move-result v2

    or-int/2addr v0, v2

    .line 478
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 481
    :cond_0
    return v0
.end method

.method public isPrivate()Z
    .locals 1

    .prologue
    .line 185
    iget-object v0, p0, Lcom/android/server/wm/DisplayContent;->mDisplay:Landroid/view/Display;

    invoke-virtual {v0}, Landroid/view/Display;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method moveHomeStackBox(Z)Z
    .locals 4
    .param p1, "toTop"    # Z

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 379
    const/16 v3, 0x791d

    if-eqz p1, :cond_1

    move v0, v1

    :goto_0
    invoke-static {v3, v0}, Landroid/util/EventLog;->writeEvent(II)I

    .line 381
    sget-boolean v0, Landroid/util/PowerMoConfig;->WITHOUT_ALL:Z

    if-nez v0, :cond_2

    .line 382
    iget-object v0, p0, Lcom/android/server/wm/DisplayContent;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mWmsFuncs:Lcom/android/server/wm/IWmSmartShowFuncs;

    invoke-interface {v0, p0, p1}, Lcom/android/server/wm/IWmSmartShowFuncs;->moveHomeStackBoxLw(Lcom/android/server/wm/DisplayContent;Z)Z

    move-result v2

    .line 393
    :cond_0
    :goto_1
    :pswitch_0
    return v2

    :cond_1
    move v0, v2

    .line 379
    goto :goto_0

    .line 385
    :cond_2
    iget-object v0, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 394
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "moveHomeStackBox: Too many toplevel StackBoxes!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 386
    :pswitch_1
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "moveHomeStackBox: No home StackBox!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 389
    :pswitch_2
    invoke-virtual {p0}, Lcom/android/server/wm/DisplayContent;->homeOnTop()Z

    move-result v0

    xor-int/2addr v0, p1

    if-eqz v0, :cond_0

    .line 390
    iget-object v0, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v2, v1

    .line 391
    goto :goto_1

    .line 385
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method numTokens()I
    .locals 3

    .prologue
    .line 245
    const/4 v0, 0x0

    .line 246
    .local v0, "count":I
    iget-object v2, p0, Lcom/android/server/wm/DisplayContent;->mTaskHistory:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, "taskNdx":I
    :goto_0
    if-ltz v1, :cond_0

    .line 247
    iget-object v2, p0, Lcom/android/server/wm/DisplayContent;->mTaskHistory:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/wm/Task;

    iget-object v2, v2, Lcom/android/server/wm/Task;->mAppTokens:Lcom/android/server/wm/AppTokenList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/2addr v0, v2

    .line 246
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 249
    :cond_0
    return v0
.end method

.method removeStackBox(Lcom/android/server/wm/StackBox;)V
    .locals 2
    .param p1, "box"    # Lcom/android/server/wm/StackBox;

    .prologue
    .line 330
    iget-object v0, p1, Lcom/android/server/wm/StackBox;->mStack:Lcom/android/server/wm/TaskStack;

    .line 331
    .local v0, "stack":Lcom/android/server/wm/TaskStack;
    if-eqz v0, :cond_0

    iget v1, v0, Lcom/android/server/wm/TaskStack;->mStackId:I

    if-nez v1, :cond_0

    .line 337
    :goto_0
    return-void

    .line 336
    :cond_0
    iget-object v1, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method removeTask(Lcom/android/server/wm/Task;)V
    .locals 1
    .param p1, "task"    # Lcom/android/server/wm/Task;

    .prologue
    .line 222
    iget-object v0, p0, Lcom/android/server/wm/DisplayContent;->mTaskHistory:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 223
    return-void
.end method

.method resetAnimationBackgroundAnimator()V
    .locals 2

    .prologue
    .line 457
    iget-object v1, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .local v0, "stackBoxNdx":I
    :goto_0
    if-ltz v0, :cond_0

    .line 458
    iget-object v1, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/wm/StackBox;

    invoke-virtual {v1}, Lcom/android/server/wm/StackBox;->resetAnimationBackgroundAnimator()V

    .line 457
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 460
    :cond_0
    return-void
.end method

.method resetDimming()V
    .locals 2

    .prologue
    .line 471
    iget-object v1, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .local v0, "stackBoxNdx":I
    :goto_0
    if-ltz v0, :cond_0

    .line 472
    iget-object v1, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/wm/StackBox;

    invoke-virtual {v1}, Lcom/android/server/wm/StackBox;->resetDimming()V

    .line 471
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 474
    :cond_0
    return-void
.end method

.method resizeStack(IF)Z
    .locals 4
    .param p1, "stackBoxId"    # I
    .param p2, "weight"    # F

    .prologue
    const/4 v2, 0x1

    .line 309
    iget-object v3, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v1, v3, -0x1

    .local v1, "stackBoxNdx":I
    :goto_0
    if-ltz v1, :cond_1

    .line 310
    iget-object v3, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/wm/StackBox;

    .line 311
    .local v0, "box":Lcom/android/server/wm/StackBox;
    invoke-virtual {v0, p1, p2}, Lcom/android/server/wm/StackBox;->resize(IF)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 312
    iput-boolean v2, p0, Lcom/android/server/wm/DisplayContent;->layoutNeeded:Z

    .line 316
    .end local v0    # "box":Lcom/android/server/wm/StackBox;
    :goto_1
    return v2

    .line 309
    .restart local v0    # "box":Lcom/android/server/wm/StackBox;
    :cond_0
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 316
    .end local v0    # "box":Lcom/android/server/wm/StackBox;
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method setStackBoxSize(Landroid/graphics/Rect;)Z
    .locals 4
    .param p1, "contentRect"    # Landroid/graphics/Rect;

    .prologue
    .line 403
    const/4 v0, 0x0

    .line 404
    .local v0, "change":Z
    iget-object v2, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, "stackBoxNdx":I
    :goto_0
    if-ltz v1, :cond_0

    .line 405
    iget-object v2, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/wm/StackBox;

    const/4 v3, 0x1

    invoke-virtual {v2, p1, v3}, Lcom/android/server/wm/StackBox;->setStackBoxSizes(Landroid/graphics/Rect;Z)Z

    move-result v2

    or-int/2addr v0, v2

    .line 404
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 407
    :cond_0
    return v0
.end method

.method setTouchExcludeRegion(Lcom/android/server/wm/TaskStack;)V
    .locals 7
    .param p1, "focusedStack"    # Lcom/android/server/wm/TaskStack;

    .prologue
    .line 426
    iget-object v4, p0, Lcom/android/server/wm/DisplayContent;->mTouchExcludeRegion:Landroid/graphics/Region;

    iget-object v5, p0, Lcom/android/server/wm/DisplayContent;->mBaseDisplayRect:Landroid/graphics/Rect;

    invoke-virtual {v4, v5}, Landroid/graphics/Region;->set(Landroid/graphics/Rect;)Z

    .line 427
    invoke-virtual {p0}, Lcom/android/server/wm/DisplayContent;->getWindowList()Lcom/android/server/wm/WindowList;

    move-result-object v3

    .line 428
    .local v3, "windows":Lcom/android/server/wm/WindowList;
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v0, v4, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_1

    .line 429
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/wm/WindowState;

    .line 430
    .local v2, "win":Lcom/android/server/wm/WindowState;
    invoke-virtual {v2}, Lcom/android/server/wm/WindowState;->getStack()Lcom/android/server/wm/TaskStack;

    move-result-object v1

    .line 431
    .local v1, "stack":Lcom/android/server/wm/TaskStack;
    invoke-virtual {v2}, Lcom/android/server/wm/WindowState;->isVisibleLw()Z

    move-result v4

    if-eqz v4, :cond_0

    if-eqz v1, :cond_0

    if-eq v1, p1, :cond_0

    .line 432
    iget-object v4, p0, Lcom/android/server/wm/DisplayContent;->mTmpRect:Landroid/graphics/Rect;

    iget-object v5, v2, Lcom/android/server/wm/WindowState;->mVisibleFrame:Landroid/graphics/Rect;

    invoke-virtual {v4, v5}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 433
    iget-object v4, p0, Lcom/android/server/wm/DisplayContent;->mTmpRect:Landroid/graphics/Rect;

    iget-object v5, v2, Lcom/android/server/wm/WindowState;->mVisibleInsets:Landroid/graphics/Rect;

    invoke-virtual {v4, v5}, Landroid/graphics/Rect;->intersect(Landroid/graphics/Rect;)Z

    .line 434
    iget-object v4, p0, Lcom/android/server/wm/DisplayContent;->mTouchExcludeRegion:Landroid/graphics/Region;

    iget-object v5, p0, Lcom/android/server/wm/DisplayContent;->mTmpRect:Landroid/graphics/Rect;

    sget-object v6, Landroid/graphics/Region$Op;->DIFFERENCE:Landroid/graphics/Region$Op;

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Region;->op(Landroid/graphics/Rect;Landroid/graphics/Region$Op;)Z

    .line 428
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 437
    .end local v1    # "stack":Lcom/android/server/wm/TaskStack;
    .end local v2    # "win":Lcom/android/server/wm/WindowState;
    :cond_1
    return-void
.end method

.method stackIdFromPoint(II)I
    .locals 3
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 421
    iget-object v1, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/wm/StackBox;

    .line 422
    .local v0, "topBox":Lcom/android/server/wm/StackBox;
    invoke-virtual {v0, p1, p2}, Lcom/android/server/wm/StackBox;->stackIdFromPoint(II)I

    move-result v1

    return v1
.end method

.method stopDimmingIfNeeded()V
    .locals 2

    .prologue
    .line 485
    iget-object v1, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .local v0, "stackBoxNdx":I
    :goto_0
    if-ltz v0, :cond_0

    .line 486
    iget-object v1, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/wm/StackBox;

    invoke-virtual {v1}, Lcom/android/server/wm/StackBox;->stopDimmingIfNeeded()V

    .line 485
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 488
    :cond_0
    return-void
.end method

.method switchUserStacks(II)V
    .locals 5
    .param p1, "oldUserId"    # I
    .param p2, "newUserId"    # I

    .prologue
    .line 440
    invoke-virtual {p0}, Lcom/android/server/wm/DisplayContent;->getWindowList()Lcom/android/server/wm/WindowList;

    move-result-object v3

    .line 441
    .local v3, "windows":Lcom/android/server/wm/WindowList;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v0, v4, :cond_1

    .line 442
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/wm/WindowState;

    .line 443
    .local v2, "win":Lcom/android/server/wm/WindowState;
    invoke-virtual {v2}, Lcom/android/server/wm/WindowState;->isHiddenFromUserLocked()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 447
    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Lcom/android/server/wm/WindowState;->hideLw(Z)Z

    .line 441
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 451
    .end local v2    # "win":Lcom/android/server/wm/WindowState;
    :cond_1
    iget-object v4, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v1, v4, -0x1

    .local v1, "stackBoxNdx":I
    :goto_1
    if-ltz v1, :cond_2

    .line 452
    iget-object v4, p0, Lcom/android/server/wm/DisplayContent;->mStackBoxes:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/server/wm/StackBox;

    invoke-virtual {v4, p2}, Lcom/android/server/wm/StackBox;->switchUserStacks(I)V

    .line 451
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .line 454
    :cond_2
    return-void
.end method

.method updateDisplayInfo()V
    .locals 2

    .prologue
    .line 230
    iget-object v0, p0, Lcom/android/server/wm/DisplayContent;->mDisplay:Landroid/view/Display;

    iget-object v1, p0, Lcom/android/server/wm/DisplayContent;->mDisplayInfo:Landroid/view/DisplayInfo;

    invoke-virtual {v0, v1}, Landroid/view/Display;->getDisplayInfo(Landroid/view/DisplayInfo;)Z

    .line 231
    return-void
.end method
