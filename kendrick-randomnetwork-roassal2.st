| v g bb es aa|
	v := RTView new.
	g := KEContactNetwork nodes: 50 topology: { #random. #p->0.2 }.
	cn:=1.
   g edges do: [ :o |
	 	f := o key.
		t := o value.
	 cn:=cn+(1 to: 1)inject: 0 into: [ :sum :each | sum + each ].].
	aa:= Array new: cn-1.
	id:= 1.
   g edges do: [:o | 
		f := o key asNumber.
		t := o value asNumber.
		aa at:id put: f->t.
		id:=id+(1 to: 1)inject: 0 into: [ :sum :each | sum + each ].].
	aa.
	es := (RTEllipse new color: (Color purple alpha: 0.3);
    size: 10)
		elementsOn: (1 to: 50).
	v  addAll: es.


	RTEdgeBuilder new
		view: v;
		shape: (RTLine new color: (Color red alpha: 0.5));
		elements: es;
		useAssociations: aa.
	es do: [ :e | e trachelShape pushBack ].
	v addAnimation: (RTSpringLayoutStepping new view: v).
   v @ RTDraggableView.
   v