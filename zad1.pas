program zad1;

function f(x: Real): Real;
begin
  Result := 2 * x * x * x - 4 * x + 15;
end;

function TrapezoidalRule(a, b: Real; n: Integer): Real;
var
  h, integral, x: Real;
  i: Integer;
begin
  h := (b - a) / n;
  integral := (f(a) + f(b)) / 2;

  for i := 1 to n - 1 do
  begin
    x := a + i * h;
    integral := integral + f(x);
  end;

  integral := integral * h;
  Result := integral;
end;

function EstimateError(a, b: Real; n: Integer): Real;
var
  h, max_value, x, error: Real;
  i: Integer;
begin
  h := (b - a) / n;
  max_value := Abs(f(a));

  for i := 1 to n - 1 do
  begin
    x := a + i * h;
    max_value := Max(max_value, Abs(f(x)));
  end;

  error := (b - a) * h * max_value / 2;
  Result := error;
end;

procedure Main;
var
  choice: Integer;
  a, b: Real;
  n: Integer;
  integral, error: Real;
begin
  repeat
    Writeln('1. Вычисление площади фигуры');
    Writeln('2. Выход');
    Write('Выберите пункт меню: ');
    Readln(choice);

    case choice of
      1:
      begin
        Write('Введите нижний предел интегрирования: ');
        Readln(a);
        Write('Введите верхний предел интегрирования: ');
        Readln(b);
        Write('Введите количество разбиений: ');
        Readln(n);

        integral := TrapezoidalRule(a, b, n);
        error := EstimateError(a, b, n);

        Writeln('Площадь фигуры: ', integral);
        Writeln('Оценка погрешности: ', error);
      end;
      2:
        Exit;
      else
        Writeln('Некорректный выбор');
    end;
  until False;
end;

begin
  Main;
end.
