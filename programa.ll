declare i32 @printf(i8*, ...)
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00"

define i32 @main() {
%federer = alloca i32
store i32 15, i32* %federer
%tmp0 = load i32, i32* %federer
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %tmp0)
ret i32 0
}
