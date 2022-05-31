//
//  TrackerBarInfoSheet.swift
//  ED-Tracker
//
//  Created by Tyee Fellows on 2021-07-14.
//

import SwiftUI

struct TrackerBarInfoSheet: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var patient: EscapeEncounterViewModel
    
    @State var triageSheetToggle: Bool = false
    @State var assessmentSheetToggle: Bool = false
    @State var investigationSheetToggle: Bool = false
    @State var reassessmentSheetToggle: Bool = false
    @State var dischargeSheetToggle: Bool = false
    
    var color1 = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))

    
    var body: some View {
        NavigationView {
            HStack {
                VStack {
                    HStack {
                        Image("currentProgressLogo")
                            .resizable()
                            .frame(width: 75, height: 75, alignment: .bottomLeading)
                        Text("ED milestones").padding()
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                        Spacer()
                    }.padding().padding(.top,30)
                    if patient.arrivalComplete {
                        VStack {
                            if patient.dischargeComplete {
                                Text("Your ED encounter is complete!")
                                    .font(.system(size: 24, weight: .bold, design: .rounded))
                                    .padding(.bottom,30)
                                    .lineLimit(2)
                                    .multilineTextAlignment(.center)
                                    .frame(width:300)
                                    .foregroundColor(color1)
                                    .padding()
                                    .onAppear(perform: {
                                        self.triageSheetToggle = false
                                        self.assessmentSheetToggle = false
                                        self.investigationSheetToggle = false
                                        self.reassessmentSheetToggle = false
                                        self.dischargeSheetToggle = false
                                    }
                                )
                                HStack {
                                    Spacer()
                                    Image("leftDownArrow")
                                        .resizable()
                                        .frame(width:18,height:20, alignment: .center)
                                        .offset(y:5)
                                        .opacity(0.5)
                                        .padding(.leading,20)

                                    Text("Review your milestones!")
                                        .font(.system(size: 21, weight: .bold, design: .rounded))
                                        .multilineTextAlignment(.center)
                                        .opacity(0.5)
                                        .padding(.leading,5)
                                    Spacer()
                                }
                            }
                            HStack {
                                if patient.triageComplete {
                                    Button(
                                        action: {
                                            self.triageSheetToggle.toggle()
                                        },
                                        label: {
                                            ZStack {
                                                Image(systemName: "checkmark.circle.fill").foregroundColor(.green).padding(.leading,75).padding(.bottom,3)
                                                Image(systemName: "checkmark.circle").padding(.leading,75).padding(.bottom,3)
                                            }
                                        })
                                } else {
                                    Button(
                                        action: {
                                            self.triageSheetToggle.toggle()
                                        },
                                        label: {
                                            Image(systemName: "circle").padding(.leading,75).padding(.bottom,3)
                                        })
                                    }
                                Button(
                                    action: {
                                        self.triageSheetToggle.toggle()
                                    },
                                    label: {
                                        Text("Triage").font(.system(size: 24, weight: .bold, design: .rounded)).padding(.leading,10).padding(.bottom,3).frame(width:300,height: 30,alignment: .leading)
                                    })
                                Spacer()
                            }.padding(.top,20)
                            if (patient.triageComplete && triageSheetToggle) || (!patient.triageComplete && !triageSheetToggle){
                                HStack {
                                    if patient.arrivalComplete {
                                        ZStack {
                                            Image(systemName: "checkmark.circle.fill").foregroundColor(.green).padding(.leading,110).padding(.top,3)
                                            Image(systemName: "checkmark.circle").padding(.leading,110).padding(.top,3)
                                        }
                                    } else { Image(systemName: "circle").padding(.leading,110).padding(.top,3) }
                                        Text("Arrive").font(.system(size: 18, weight: .medium, design: .rounded)).padding(.leading,10).padding(.top,3) .frame(width:100,height: 30,alignment: .leading)
                                    Spacer()
                                }
                                HStack {
                                    if patient.registerComplete {
                                        ZStack {
                                            Image(systemName: "checkmark.circle.fill").foregroundColor(.green).padding(.leading,110).padding(.top,3)
                                            Image(systemName: "checkmark.circle").padding(.leading,110).padding(.top,3)
                                        }
                                    } else { Image(systemName: "circle").padding(.leading,110).padding(.top,3) }
                                    Text("Register").font(.system(size: 18, weight: .medium, design: .rounded)).padding(.leading,10).frame(width:100,height: 40,alignment: .leading)
                                    Spacer()
                                }
                            }
                        }
                    }
                    
                    if patient.triageComplete {
                        VStack {
                            HStack {
                                if patient.assessmentComplete {
                                    Button(
                                        action: {
                                            self.assessmentSheetToggle.toggle()
                                        },
                                        label: {
                                            ZStack {
                                                Image(systemName: "checkmark.circle.fill").foregroundColor(.green).padding(.leading,75).padding(.bottom,3)
                                                Image(systemName: "checkmark.circle").padding(.leading,75).padding(.bottom,3)
                                            }
                                        })
                                } else {
                                    Button(
                                        action: {
                                            self.assessmentSheetToggle.toggle()
                                        },
                                        label: {
                                            Image(systemName: "circle").padding(.leading,75).padding(.bottom,3) }
                                    )
                                }
                                
                                Button(
                                    action: {
                                        self.assessmentSheetToggle.toggle()
                                    },
                                    label: {
                                        Text("Primary Assessment").font(.system(size: 24, weight: .bold, design: .rounded)).padding(.leading,10).padding(.bottom,3).frame(width:300,height: 30,alignment: .leading)
                                    })
                                Spacer()
                            }
                            if (patient.assessmentComplete && assessmentSheetToggle) || (!patient.assessmentComplete && !assessmentSheetToggle && !patient.initialInvestigationsOrdered) ||
                                (patient.assessmentComplete && !assessmentSheetToggle && !patient.initialInvestigationsOrdered) {
                                HStack {
                                    if patient.firstRnAssessmentComplete {
                                        ZStack {
                                            Image(systemName: "checkmark.circle.fill").foregroundColor(.green).padding(.leading,110).padding(.top,3)
                                            Image(systemName: "checkmark.circle").padding(.leading,110).padding(.top,3)
                                        }
                                    } else { Image(systemName: "circle").padding(.leading,110).padding(.top,3) }
                                    Text("RN assessment").font(.system(size: 18, weight: .medium, design: .rounded)).padding(.leading,10).padding(.top,3).frame(width:200,height: 30,alignment: .leading)
                                    Spacer()
                                }
                                HStack {
                                    if patient.firstMdAssessmentComplete {
                                        ZStack {
                                            Image(systemName: "checkmark.circle.fill").foregroundColor(.green).padding(.leading,110).padding(.top,3)
                                            Image(systemName: "checkmark.circle").padding(.leading,110).padding(.top,3)
                                        }
                                    } else { Image(systemName: "circle").padding(.leading,110).padding(.top,3) }
                                    Text("MD assessment").font(.system(size: 18, weight: .medium, design: .rounded)).padding(.leading,10).frame(width:200,height: 40,alignment: .leading)
                                    Spacer()
                                }
                            }
                        }
                    }
                    
                    if (patient.assessmentComplete && patient.initialInvestigationsOrdered) {
                        VStack {
                            HStack {
                                if patient.investigationsComplete {
                                    Button(
                                        action: {
                                            self.investigationSheetToggle.toggle()
                                        },
                                        label: {
                                            ZStack {
                                                Image(systemName: "checkmark.circle.fill").foregroundColor(.green).padding(.leading,75).padding(.bottom,3)
                                                Image(systemName: "checkmark.circle").padding(.leading,75).padding(.bottom,3)
                                            }
                                        })
                                } else {
                                    Button(
                                        action: {
                                            self.investigationSheetToggle.toggle()
                                        },
                                        label: {
                                            Image(systemName: "circle").padding(.leading,75).padding(.bottom,3) }
                                )}
                                Button(
                                    action: {
                                        self.investigationSheetToggle.toggle()
                                    },
                                    label: {
                                        Text("Investigation(s)").font(.system(size: 24, weight: .bold, design: .rounded)).padding(.leading,10).padding(.bottom,3).frame(width:300,height: 30,alignment: .leading)
                                    })
                                Spacer()
                            }
                            if (patient.assessmentComplete && (investigationSheetToggle || !patient.investigationsComplete )) {
                                if patient.initialMedicationsOrdered {
                                    
                                    HStack {
                                        if patient.initialMedicationsComplete {
                                            ZStack {
                                                Image(systemName: "checkmark.circle.fill").foregroundColor(.green).padding(.leading,110).padding(.top,3)
                                                Image(systemName: "checkmark.circle").padding(.leading,110).padding(.top,3)
                                            }
                                        } else { Image(systemName: "circle").padding(.leading,110).padding(.top,3) }
                                        Text("Medication(s)").font(.system(size: 18, weight: .medium, design: .rounded)).padding(.leading,10).frame(width:200,height: 40,alignment: .leading)
                                        Spacer()
                                    }
                                }
                                if patient.initialBloodworkOrdered {
                                    HStack {
                                        if patient.initialBloodworkComplete {
                                            ZStack {
                                                Image(systemName: "checkmark.circle.fill").foregroundColor(.green).padding(.leading,110).padding(.top,3)
                                                Image(systemName: "checkmark.circle").padding(.leading,110).padding(.top,3)
                                            }
                                        } else { Image(systemName: "circle").padding(.leading,110).padding(.top,3) }
                                        Text("Bloodwork").font(.system(size: 18, weight: .medium, design: .rounded)).padding(.leading,10).frame(width:200,height: 40,alignment: .leading)
                                        Spacer()
                                    }
                                }
                                if patient.initialXrayOrdered {
                                    HStack {
                                        if patient.initialXrayComplete {
                                            ZStack {
                                                Image(systemName: "checkmark.circle.fill").foregroundColor(.green).padding(.leading,110).padding(.top,3)
                                                Image(systemName: "checkmark.circle").padding(.leading,110).padding(.top,3)
                                            }
                                        } else { Image(systemName: "circle").padding(.leading,110).padding(.top,3) }
                                        Text("X-ray(s)").font(.system(size: 18, weight: .medium, design: .rounded)).padding(.leading,10) .frame(width:200,height: 40,alignment: .leading)
                                        Spacer()
                                    }
                                }
                                if patient.initialUltrasoundOrdered {
                                    HStack {
                                        if patient.initialUltrasoundComplete {
                                            ZStack {
                                                Image(systemName: "checkmark.circle.fill").foregroundColor(.green).padding(.leading,110).padding(.top,3)
                                                Image(systemName: "checkmark.circle").padding(.leading,110).padding(.top,3)
                                            }
                                        } else { Image(systemName: "circle").padding(.leading,110).padding(.top,3) }
                                        Text("Ultrasound").font(.system(size: 18, weight: .medium, design: .rounded)).padding(.leading,10).frame(width:200,height: 40,alignment: .leading)
                                        Spacer()
                                    }
                                }
                                if patient.initialCTOrdered {
                                    HStack {
                                        if patient.initialCTComplete {
                                            ZStack {
                                                Image(systemName: "checkmark.circle.fill").foregroundColor(.green).padding(.leading,110).padding(.top,3)
                                                Image(systemName: "checkmark.circle").padding(.leading,110).padding(.top,3)
                                            }
                                        } else { Image(systemName: "circle").padding(.leading,110).padding(.top,3) }
                                        Text("CT scan").font(.system(size: 18, weight: .medium, design: .rounded)).padding(.leading,10).frame(width:200,height: 40,alignment: .leading)
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                    
                    if patient.investigationsComplete {
                        VStack {
                            HStack {
                                if patient.reassessmentComplete {
                                    Button(
                                        action: {
                                            self.reassessmentSheetToggle.toggle()
                                        },
                                        label: {
                                            ZStack {
                                                Image(systemName: "checkmark.circle.fill").foregroundColor(.green).padding(.leading,75).padding(.bottom,3)
                                                Image(systemName: "checkmark.circle").padding(.leading,75).padding(.bottom,3)
                                            }
                                        })
                                } else {
                                    Button(
                                        action: {
                                            self.reassessmentSheetToggle.toggle()
                                        },
                                        label: {
                                            Image(systemName: "circle").padding(.leading,75).padding(.bottom,3) }
                                    )}
                                Button(
                                    action: {
                                        self.reassessmentSheetToggle.toggle()
                                    },
                                    label: {
                                        Text("Reassessment").font(.system(size: 24, weight: .bold, design: .rounded)).padding(.leading,10).padding(.bottom,3).frame(width:300,height: 30,alignment: .leading)
                                    })
                                Spacer()
                            }
                            if (patient.investigationsComplete && (reassessmentSheetToggle || !patient.reassessmentComplete )) {
                                HStack {
                                    if patient.secondRnAssessmentComplete {
                                        ZStack {
                                            Image(systemName: "checkmark.circle.fill").foregroundColor(.green).padding(.leading,110).padding(.top,3)
                                            Image(systemName: "checkmark.circle").padding(.leading,110).padding(.top,3)
                                        }
                                    } else { Image(systemName: "circle").padding(.leading,110).padding(.top,3) }
                                    Text("RN reassessment").font(.system(size: 18, weight: .medium, design: .rounded)).padding(.leading,10).frame(width:200,height: 40,alignment: .leading)
                                    Spacer()
                                }
                                HStack {
                                    if patient.secondMdAssessmentComplete {
                                        ZStack {
                                            Image(systemName: "checkmark.circle.fill").foregroundColor(.green).padding(.leading,110).padding(.top,3)
                                            Image(systemName: "checkmark.circle").padding(.leading,110).padding(.top,3)
                                        }
                                    } else { Image(systemName: "circle").padding(.leading,110).padding(.top,3) }
                                    Text("MD reassessment").font(.system(size: 18, weight: .medium, design: .rounded)).padding(.leading,10).frame(width:200,height: 40,alignment: .leading)
                                    Spacer()
                                }
                                if patient.consultCalledComplete {
                                    HStack {
                                        if patient.consultFinishedComplete {
                                            ZStack {
                                                Image(systemName: "checkmark.circle.fill").foregroundColor(.green).padding(.leading,110).padding(.top,3)
                                                Image(systemName: "checkmark.circle").padding(.leading,110).padding(.top,3)
                                            }
                                        } else { Image(systemName: "circle").padding(.leading,110).padding(.top,3) }
                                        Text("Consultation").font(.system(size: 18, weight: .medium, design: .rounded)).padding(.leading,10) .frame(width:200,height: 40,alignment: .leading)
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                    
                    if patient.reassessmentComplete {
                        VStack {
                            HStack {
                                if patient.dischargeComplete {
                                    Button(
                                        action: {
                                            self.dischargeSheetToggle.toggle()
                                        },
                                        label: {
                                            ZStack {
                                                Image(systemName: "checkmark.circle.fill").foregroundColor(.green).padding(.leading,75).padding(.bottom,3)
                                                Image(systemName: "checkmark.circle").padding(.leading,75).padding(.bottom,3)
                                            }
                                    })
                                } else {
                                    Button(
                                        action: {
                                            self.dischargeSheetToggle.toggle()
                                        },
                                        label: {
                                            Image(systemName: "circle").padding(.leading,75).padding(.bottom,3) }
                                    )}
                                Button(
                                    action: {
                                        self.dischargeSheetToggle.toggle()
                                    },
                                    label: {
                                        Text("Disposition").font(.system(size: 24, weight: .bold, design: .rounded)).padding(.leading,10).padding(.bottom,3).frame(width:300,height: 30,alignment: .leading)
                                    })
                                Spacer()
                            }
                            if (patient.reassessmentComplete && (dischargeSheetToggle || !patient.dischargeComplete)) {
                                HStack {
                                    if patient.dispositionComplete {
                                        ZStack {
                                            Image(systemName: "checkmark.circle.fill").foregroundColor(.green).padding(.leading,110).padding(.top,3)
                                            Image(systemName: "checkmark.circle").padding(.leading,110).padding(.top,3)
                                        }
                                    } else { Image(systemName: "circle").padding(.leading,110).padding(.top,3) }
                                    Text("Decision to\nadmit/discharge").font(.system(size: 18, weight: .medium, design: .rounded)).padding(.leading,10).lineLimit(2).multilineTextAlignment(.leading).frame(width:165)
                                    Spacer()
                                }
                            }
                        }
                    }

                    Spacer()
                }.padding()
                Spacer()
            }.background(Color.lightBlue).edgesIgnoringSafeArea(.all)
            .navigationBarItems(
                trailing:
                    Button(
                        action: { presentationMode.wrappedValue.dismiss() },
                        label: { Image(systemName: "xmark.circle").resizable().scaleEffect(2,anchor: .center).padding(.top,20).padding(.trailing,10) }
                    )
            )
        }
    }
}

struct TrackerBarInfoSheet_Previews: PreviewProvider {
    static var previews: some View {
        TrackerBarInfoSheet()
    }
}
