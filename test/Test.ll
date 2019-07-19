; ModuleID = 'Test.c'
source_filename = "Test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @test(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f) #0 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %e.addr = alloca i32, align 4
  %f.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %e, i32* %e.addr, align 4
  store i32 %f, i32* %f.addr, align 4
  %0 = load i32, i32* %b.addr, align 4
  %1 = load i32, i32* %c.addr, align 4
  %add = add nsw i32 %0, %1
  store i32 %add, i32* %a.addr, align 4
  %2 = load i32, i32* %a.addr, align 4
  %3 = load i32, i32* %d.addr, align 4
  %sub = sub nsw i32 %2, %3
  store i32 %sub, i32* %b.addr, align 4
  %4 = load i32, i32* %b.addr, align 4
  %5 = load i32, i32* %c.addr, align 4
  %add1 = add nsw i32 %4, %5
  store i32 %add1, i32* %c.addr, align 4
  %6 = load i32, i32* %a.addr, align 4
  %7 = load i32, i32* %d.addr, align 4
  %sub2 = sub nsw i32 %6, %7
  %8 = load i32, i32* %e.addr, align 4
  %mul = mul nsw i32 %8, 5
  %add3 = add nsw i32 %sub2, %mul
  store i32 %add3, i32* %d.addr, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @test1(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g) #0 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %e.addr = alloca i32, align 4
  %f.addr = alloca i32, align 4
  %g.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %e, i32* %e.addr, align 4
  store i32 %f, i32* %f.addr, align 4
  store i32 %g, i32* %g.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %1 = load i32, i32* %b.addr, align 4
  %add = add nsw i32 %0, %1
  store i32 %add, i32* %c.addr, align 4
  %2 = load i32, i32* %c.addr, align 4
  %add1 = add nsw i32 %2, 5
  store i32 %add1, i32* %d.addr, align 4
  %3 = load i32, i32* %a.addr, align 4
  %4 = load i32, i32* %b.addr, align 4
  %add2 = add nsw i32 %3, %4
  store i32 %add2, i32* %e.addr, align 4
  %5 = load i32, i32* %e.addr, align 4
  %add3 = add nsw i32 %5, 5
  store i32 %add3, i32* %f.addr, align 4
  %6 = load i32, i32* %d.addr, align 4
  %7 = load i32, i32* %f.addr, align 4
  %add4 = add nsw i32 %6, %7
  store i32 %add4, i32* %g.addr, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @test2(i32 %a, i32 %b, i32 %c, i32 %x, i32 %y) #0 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  %0 = load i32, i32* %x.addr, align 4
  %1 = load i32, i32* %y.addr, align 4
  %add = add nsw i32 %0, %1
  store i32 %add, i32* %b.addr, align 4
  %2 = load i32, i32* %x.addr, align 4
  %3 = load i32, i32* %y.addr, align 4
  %add1 = add nsw i32 %2, %3
  store i32 %add1, i32* %a.addr, align 4
  store i32 17, i32* %a.addr, align 4
  %4 = load i32, i32* %x.addr, align 4
  %5 = load i32, i32* %y.addr, align 4
  %add2 = add nsw i32 %4, %5
  store i32 %add2, i32* %c.addr, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @test3(i32 %a, i32 %c, i32 %d, i32 %x, i32 %y, i32 %z) #0 {
entry:
  %a.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %z.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  store i32 %z, i32* %z.addr, align 4
  %0 = load i32, i32* %x.addr, align 4
  %1 = load i32, i32* %y.addr, align 4
  %add = add nsw i32 %0, %1
  store i32 %add, i32* %a.addr, align 4
  %2 = load i32, i32* %y.addr, align 4
  store i32 %2, i32* %z.addr, align 4
  store i32 17, i32* %d.addr, align 4
  %3 = load i32, i32* %x.addr, align 4
  %4 = load i32, i32* %z.addr, align 4
  %add1 = add nsw i32 %3, %4
  store i32 %add1, i32* %c.addr, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @test4(i32 %a, i32 %b, i32 %c, i32 %d) #0 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  %0 = load i32, i32* %b.addr, align 4
  %1 = load i32, i32* %c.addr, align 4
  %add = add nsw i32 %0, %1
  store i32 %add, i32* %a.addr, align 4
  %2 = load i32, i32* %a.addr, align 4
  %3 = load i32, i32* %d.addr, align 4
  %sub = sub nsw i32 %2, %3
  store i32 %sub, i32* %b.addr, align 4
  %4 = load i32, i32* %b.addr, align 4
  %5 = load i32, i32* %c.addr, align 4
  %add1 = add nsw i32 %4, %5
  store i32 %add1, i32* %c.addr, align 4
  %6 = load i32, i32* %a.addr, align 4
  %7 = load i32, i32* %d.addr, align 4
  %sub2 = sub nsw i32 %6, %7
  store i32 %sub2, i32* %d.addr, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @test5(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e) #0 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %e.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %e, i32* %e.addr, align 4
  %0 = load i32, i32* %b.addr, align 4
  %1 = load i32, i32* %c.addr, align 4
  %mul = mul nsw i32 %0, %1
  store i32 %mul, i32* %a.addr, align 4
  %2 = load i32, i32* %b.addr, align 4
  store i32 %2, i32* %d.addr, align 4
  %3 = load i32, i32* %a.addr, align 4
  %4 = load i32, i32* %b.addr, align 4
  %add = add nsw i32 %3, %4
  store i32 %add, i32* %c.addr, align 4
  %5 = load i32, i32* %d.addr, align 4
  %6 = load i32, i32* %c.addr, align 4
  %mul1 = mul nsw i32 %5, %6
  store i32 %mul1, i32* %e.addr, align 4
  %7 = load i32, i32* %c.addr, align 4
  %add2 = add nsw i32 %7, 5
  store i32 %add2, i32* %d.addr, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @test6(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %i, i32 %j, i32 %t1, i32 %t2, i32 %t3, i32 %t4) #0 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %e.addr = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %j.addr = alloca i32, align 4
  %t1.addr = alloca i32, align 4
  %t2.addr = alloca i32, align 4
  %t3.addr = alloca i32, align 4
  %t4.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %e, i32* %e.addr, align 4
  store i32 %i, i32* %i.addr, align 4
  store i32 %j, i32* %j.addr, align 4
  store i32 %t1, i32* %t1.addr, align 4
  store i32 %t2, i32* %t2.addr, align 4
  store i32 %t3, i32* %t3.addr, align 4
  store i32 %t4, i32* %t4.addr, align 4
  store i32 10, i32* %a.addr, align 4
  store i32 40, i32* %b.addr, align 4
  %0 = load i32, i32* %i.addr, align 4
  %1 = load i32, i32* %j.addr, align 4
  %mul = mul nsw i32 %0, %1
  store i32 %mul, i32* %t1.addr, align 4
  %2 = load i32, i32* %t1.addr, align 4
  %add = add nsw i32 %2, 40
  store i32 %add, i32* %c.addr, align 4
  store i32 150, i32* %t2.addr, align 4
  %3 = load i32, i32* %c.addr, align 4
  %mul1 = mul nsw i32 150, %3
  store i32 %mul1, i32* %d.addr, align 4
  %4 = load i32, i32* %i.addr, align 4
  store i32 %4, i32* %e.addr, align 4
  %5 = load i32, i32* %i.addr, align 4
  %6 = load i32, i32* %j.addr, align 4
  %mul2 = mul nsw i32 %5, %6
  store i32 %mul2, i32* %t3.addr, align 4
  %7 = load i32, i32* %i.addr, align 4
  %mul3 = mul nsw i32 %7, 10
  store i32 %mul3, i32* %t4.addr, align 4
  %8 = load i32, i32* %t1.addr, align 4
  %9 = load i32, i32* %t4.addr, align 4
  %add4 = add nsw i32 %8, %9
  store i32 %add4, i32* %c.addr, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  call void @test(i32 10, i32 11, i32 25, i32 33, i32 43, i32 26)
  call void @test1(i32 10, i32 11, i32 25, i32 33, i32 43, i32 26, i32 44)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (trunk 351520)"}
