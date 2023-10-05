; ModuleID = 'game.c'
source_filename = "game.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @fill_next_state(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  store i32 0, ptr %9, align 4
  br label %14

14:                                               ; preds = %74, %4
  %15 = load i32, ptr %9, align 4
  %16 = load i32, ptr %8, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %77

18:                                               ; preds = %14
  store i32 0, ptr %10, align 4
  br label %19

19:                                               ; preds = %70, %18
  %20 = load i32, ptr %10, align 4
  %21 = load i32, ptr %7, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %73

23:                                               ; preds = %19
  %24 = load ptr, ptr %5, align 8
  %25 = load i32, ptr %7, align 4
  %26 = load i32, ptr %8, align 4
  %27 = load i32, ptr %9, align 4
  %28 = load i32, ptr %10, align 4
  %29 = call i32 @calc_neighbors(ptr noundef %24, i32 noundef %25, i32 noundef %26, i32 noundef %27, i32 noundef %28)
  store i32 %29, ptr %11, align 4
  %30 = load i32, ptr %9, align 4
  %31 = load i32, ptr %7, align 4
  %32 = mul nsw i32 %30, %31
  %33 = load i32, ptr %10, align 4
  %34 = add nsw i32 %32, %33
  store i32 %34, ptr %12, align 4
  %35 = load ptr, ptr %5, align 8
  %36 = load i32, ptr %12, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8, ptr %35, i64 %37
  %39 = load i8, ptr %38, align 1
  %40 = icmp ne i8 %39, 0
  br i1 %40, label %41, label %59

41:                                               ; preds = %23
  %42 = load i32, ptr %11, align 4
  %43 = icmp eq i32 %42, 3
  br i1 %43, label %47, label %44

44:                                               ; preds = %41
  %45 = load i32, ptr %11, align 4
  %46 = icmp eq i32 %45, 4
  br label %47

47:                                               ; preds = %44, %41
  %48 = phi i1 [ true, %41 ], [ %46, %44 ]
  %49 = zext i1 %48 to i32
  store i32 %49, ptr %13, align 4
  %50 = load i32, ptr %13, align 4
  %51 = icmp ne i32 %50, 0
  %52 = zext i1 %51 to i64
  %53 = select i1 %51, i32 1, i32 0
  %54 = trunc i32 %53 to i8
  %55 = load ptr, ptr %6, align 8
  %56 = load i32, ptr %12, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i8, ptr %55, i64 %57
  store i8 %54, ptr %58, align 1
  br label %69

59:                                               ; preds = %23
  %60 = load i32, ptr %11, align 4
  %61 = icmp eq i32 %60, 3
  %62 = zext i1 %61 to i64
  %63 = select i1 %61, i32 1, i32 0
  %64 = trunc i32 %63 to i8
  %65 = load ptr, ptr %6, align 8
  %66 = load i32, ptr %12, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i8, ptr %65, i64 %67
  store i8 %64, ptr %68, align 1
  br label %69

69:                                               ; preds = %59, %47
  br label %70

70:                                               ; preds = %69
  %71 = load i32, ptr %10, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, ptr %10, align 4
  br label %19, !llvm.loop !6

73:                                               ; preds = %19
  br label %74

74:                                               ; preds = %73
  %75 = load i32, ptr %9, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, ptr %9, align 4
  br label %14, !llvm.loop !8

77:                                               ; preds = %14
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define internal i32 @calc_neighbors(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) #0 {
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store i32 %2, ptr %8, align 4
  store i32 %3, ptr %9, align 4
  store i32 %4, ptr %10, align 4
  store i32 0, ptr %11, align 4
  store i32 -1, ptr %12, align 4
  br label %18

18:                                               ; preds = %73, %5
  %19 = load i32, ptr %12, align 4
  %20 = icmp sle i32 %19, 1
  br i1 %20, label %21, label %76

21:                                               ; preds = %18
  store i32 -1, ptr %13, align 4
  br label %22

22:                                               ; preds = %69, %21
  %23 = load i32, ptr %13, align 4
  %24 = icmp sle i32 %23, 1
  br i1 %24, label %25, label %72

25:                                               ; preds = %22
  %26 = load i32, ptr %9, align 4
  %27 = load i32, ptr %12, align 4
  %28 = add nsw i32 %26, %27
  store i32 %28, ptr %14, align 4
  %29 = load i32, ptr %10, align 4
  %30 = load i32, ptr %13, align 4
  %31 = add nsw i32 %29, %30
  store i32 %31, ptr %15, align 4
  %32 = load i32, ptr %14, align 4
  %33 = icmp sle i32 0, %32
  br i1 %33, label %34, label %38

34:                                               ; preds = %25
  %35 = load i32, ptr %14, align 4
  %36 = load i32, ptr %8, align 4
  %37 = icmp slt i32 %35, %36
  br label %38

38:                                               ; preds = %34, %25
  %39 = phi i1 [ false, %25 ], [ %37, %34 ]
  %40 = zext i1 %39 to i32
  store i32 %40, ptr %16, align 4
  %41 = load i32, ptr %15, align 4
  %42 = icmp sle i32 0, %41
  br i1 %42, label %43, label %47

43:                                               ; preds = %38
  %44 = load i32, ptr %15, align 4
  %45 = load i32, ptr %7, align 4
  %46 = icmp slt i32 %44, %45
  br label %47

47:                                               ; preds = %43, %38
  %48 = phi i1 [ false, %38 ], [ %46, %43 ]
  %49 = zext i1 %48 to i32
  store i32 %49, ptr %17, align 4
  %50 = load i32, ptr %16, align 4
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %52, label %68

52:                                               ; preds = %47
  %53 = load i32, ptr %17, align 4
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %55, label %68

55:                                               ; preds = %52
  %56 = load ptr, ptr %6, align 8
  %57 = load i32, ptr %14, align 4
  %58 = load i32, ptr %7, align 4
  %59 = mul nsw i32 %57, %58
  %60 = load i32, ptr %15, align 4
  %61 = add nsw i32 %59, %60
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8, ptr %56, i64 %62
  %64 = load i8, ptr %63, align 1
  %65 = sext i8 %64 to i32
  %66 = load i32, ptr %11, align 4
  %67 = add nsw i32 %66, %65
  store i32 %67, ptr %11, align 4
  br label %68

68:                                               ; preds = %55, %52, %47
  br label %69

69:                                               ; preds = %68
  %70 = load i32, ptr %13, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, ptr %13, align 4
  br label %22, !llvm.loop !9

72:                                               ; preds = %22
  br label %73

73:                                               ; preds = %72
  %74 = load i32, ptr %12, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, ptr %12, align 4
  br label %18, !llvm.loop !10

76:                                               ; preds = %18
  %77 = load i32, ptr %11, align 4
  ret i32 %77
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @fill_pixels(ptr noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6) #0 {
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i8, align 1
  %29 = alloca i32, align 4
  store ptr %0, ptr %8, align 8
  store i32 %1, ptr %9, align 4
  store i32 %2, ptr %10, align 4
  store ptr %3, ptr %11, align 8
  store i32 %4, ptr %12, align 4
  store i32 %5, ptr %13, align 4
  store i32 %6, ptr %14, align 4
  %30 = load i32, ptr %13, align 4
  %31 = load i32, ptr %10, align 4
  %32 = sdiv i32 %30, %31
  store i32 %32, ptr %15, align 4
  %33 = load i32, ptr %12, align 4
  %34 = load i32, ptr %9, align 4
  %35 = sdiv i32 %33, %34
  store i32 %35, ptr %16, align 4
  %36 = load i32, ptr %15, align 4
  %37 = load i32, ptr %16, align 4
  %38 = icmp slt i32 %36, %37
  br i1 %38, label %39, label %41

39:                                               ; preds = %7
  %40 = load i32, ptr %15, align 4
  br label %43

41:                                               ; preds = %7
  %42 = load i32, ptr %16, align 4
  br label %43

43:                                               ; preds = %41, %39
  %44 = phi i32 [ %40, %39 ], [ %42, %41 ]
  store i32 %44, ptr %17, align 4
  %45 = load i32, ptr %13, align 4
  %46 = load i32, ptr %17, align 4
  %47 = load i32, ptr %10, align 4
  %48 = mul nsw i32 %46, %47
  %49 = sub nsw i32 %45, %48
  %50 = sdiv i32 %49, 2
  store i32 %50, ptr %18, align 4
  %51 = load i32, ptr %12, align 4
  %52 = load i32, ptr %17, align 4
  %53 = load i32, ptr %9, align 4
  %54 = mul nsw i32 %52, %53
  %55 = sub nsw i32 %51, %54
  %56 = sdiv i32 %55, 2
  store i32 %56, ptr %19, align 4
  store i32 0, ptr %20, align 4
  br label %57

57:                                               ; preds = %167, %43
  %58 = load i32, ptr %20, align 4
  %59 = load i32, ptr %13, align 4
  %60 = icmp slt i32 %58, %59
  br i1 %60, label %61, label %170

61:                                               ; preds = %57
  store i32 0, ptr %21, align 4
  br label %62

62:                                               ; preds = %163, %61
  %63 = load i32, ptr %21, align 4
  %64 = load i32, ptr %12, align 4
  %65 = icmp slt i32 %63, %64
  br i1 %65, label %66, label %166

66:                                               ; preds = %62
  %67 = load i32, ptr %14, align 4
  %68 = load i32, ptr %20, align 4
  %69 = load i32, ptr %12, align 4
  %70 = mul nsw i32 %68, %69
  %71 = load i32, ptr %21, align 4
  %72 = add nsw i32 %70, %71
  %73 = mul nsw i32 %67, %72
  store i32 %73, ptr %22, align 4
  %74 = load i32, ptr %20, align 4
  %75 = load i32, ptr %18, align 4
  %76 = icmp slt i32 %74, %75
  br i1 %76, label %81, label %77

77:                                               ; preds = %66
  %78 = load i32, ptr %21, align 4
  %79 = load i32, ptr %19, align 4
  %80 = icmp slt i32 %78, %79
  br i1 %80, label %81, label %97

81:                                               ; preds = %77, %66
  store i32 0, ptr %23, align 4
  br label %82

82:                                               ; preds = %93, %81
  %83 = load i32, ptr %23, align 4
  %84 = load i32, ptr %14, align 4
  %85 = icmp slt i32 %83, %84
  br i1 %85, label %86, label %96

86:                                               ; preds = %82
  %87 = load ptr, ptr %11, align 8
  %88 = load i32, ptr %22, align 4
  %89 = load i32, ptr %23, align 4
  %90 = add nsw i32 %88, %89
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i8, ptr %87, i64 %91
  store i8 127, ptr %92, align 1
  br label %93

93:                                               ; preds = %86
  %94 = load i32, ptr %23, align 4
  %95 = add nsw i32 %94, 1
  store i32 %95, ptr %23, align 4
  br label %82, !llvm.loop !11

96:                                               ; preds = %82
  br label %163

97:                                               ; preds = %77
  %98 = load i32, ptr %20, align 4
  %99 = load i32, ptr %18, align 4
  %100 = sub nsw i32 %98, %99
  %101 = load i32, ptr %17, align 4
  %102 = sdiv i32 %100, %101
  store i32 %102, ptr %24, align 4
  %103 = load i32, ptr %21, align 4
  %104 = load i32, ptr %19, align 4
  %105 = sub nsw i32 %103, %104
  %106 = load i32, ptr %17, align 4
  %107 = sdiv i32 %105, %106
  store i32 %107, ptr %25, align 4
  %108 = load i32, ptr %24, align 4
  %109 = load i32, ptr %10, align 4
  %110 = icmp sge i32 %108, %109
  br i1 %110, label %115, label %111

111:                                              ; preds = %97
  %112 = load i32, ptr %25, align 4
  %113 = load i32, ptr %9, align 4
  %114 = icmp sge i32 %112, %113
  br i1 %114, label %115, label %131

115:                                              ; preds = %111, %97
  store i32 0, ptr %26, align 4
  br label %116

116:                                              ; preds = %127, %115
  %117 = load i32, ptr %26, align 4
  %118 = load i32, ptr %14, align 4
  %119 = icmp slt i32 %117, %118
  br i1 %119, label %120, label %130

120:                                              ; preds = %116
  %121 = load ptr, ptr %11, align 8
  %122 = load i32, ptr %22, align 4
  %123 = load i32, ptr %26, align 4
  %124 = add nsw i32 %122, %123
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i8, ptr %121, i64 %125
  store i8 127, ptr %126, align 1
  br label %127

127:                                              ; preds = %120
  %128 = load i32, ptr %26, align 4
  %129 = add nsw i32 %128, 1
  store i32 %129, ptr %26, align 4
  br label %116, !llvm.loop !12

130:                                              ; preds = %116
  br label %163

131:                                              ; preds = %111
  %132 = load i32, ptr %24, align 4
  %133 = load i32, ptr %9, align 4
  %134 = mul nsw i32 %132, %133
  %135 = load i32, ptr %25, align 4
  %136 = add nsw i32 %134, %135
  store i32 %136, ptr %27, align 4
  %137 = load ptr, ptr %8, align 8
  %138 = load i32, ptr %27, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds i8, ptr %137, i64 %139
  %141 = load i8, ptr %140, align 1
  store i8 %141, ptr %28, align 1
  store i32 0, ptr %29, align 4
  br label %142

142:                                              ; preds = %159, %131
  %143 = load i32, ptr %29, align 4
  %144 = load i32, ptr %14, align 4
  %145 = icmp slt i32 %143, %144
  br i1 %145, label %146, label %162

146:                                              ; preds = %142
  %147 = load i8, ptr %28, align 1
  %148 = sext i8 %147 to i32
  %149 = icmp ne i32 %148, 0
  %150 = zext i1 %149 to i64
  %151 = select i1 %149, i32 0, i32 255
  %152 = trunc i32 %151 to i8
  %153 = load ptr, ptr %11, align 8
  %154 = load i32, ptr %22, align 4
  %155 = load i32, ptr %29, align 4
  %156 = add nsw i32 %154, %155
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds i8, ptr %153, i64 %157
  store i8 %152, ptr %158, align 1
  br label %159

159:                                              ; preds = %146
  %160 = load i32, ptr %29, align 4
  %161 = add nsw i32 %160, 1
  store i32 %161, ptr %29, align 4
  br label %142, !llvm.loop !13

162:                                              ; preds = %142
  br label %163

163:                                              ; preds = %162, %130, %96
  %164 = load i32, ptr %21, align 4
  %165 = add nsw i32 %164, 1
  store i32 %165, ptr %21, align 4
  br label %62, !llvm.loop !14

166:                                              ; preds = %62
  br label %167

167:                                              ; preds = %166
  %168 = load i32, ptr %20, align 4
  %169 = add nsw i32 %168, 1
  store i32 %169, ptr %20, align 4
  br label %57, !llvm.loop !15

170:                                              ; preds = %57
  ret void
}

attributes #0 = { noinline nounwind optnone sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 16.0.6"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
