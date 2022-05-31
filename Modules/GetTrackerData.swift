//
//  GetTrackerData.swift
//  ED-Tracker
//
//  Created by Tyee Fellows on 2021-07-06.
//

import Foundation

// MARK: - EncounterResponse
struct EncounterResponse: Codable {
    let scanDateTime: String
    let results: [EncounterResult]
}

// MARK: - Encounter Result
struct EncounterResult: Codable {
    let mrn, encounter, firstName, middleName, lastName: String
    let gender, birthdate, age, postalCode, residenceType, chiefComplaint: String
    let triageLevel, triageSBP, triageDBP, triageHR: String
    let triageRR, triageOxygen, triageTemp, cedisDescription: String
    let descriptionOfInjury, arrivalDate, arrivalTime, registrationDate: String
    let registrationTime, triageDate, triageTime, lengthOfStay: String
    let dateFirstSeenByRn, timeFirstSeenByRn, dateFirstSeenByMd, timeFirstSeenByMd: String
    let dateReassessedByRn, timeReassessedByRn, dateReassessedByMd, timeReassessedByMd: String
    let dateLabOrdered, timeLabOrdered, dateLabReported: String
    let timeLabReported, dateXrayRequested, timeXrayRequested, dateXrayReported: String
    let timeXrayReported, dateUltrasoundRequested, timeUltrasoundRequested, dateUltrasoundReported: String
    let timeUltrasoundReported, dateCTRequested,timeCTRequested, dateCTReported, timeCTReported,edMedOrderedDate, edMedOrderedTime, edMedDateDelivered: String
    let edMedTimeDelivered, dateConsultantCalled, timeConsultantCalled, dateConsultationCompleted: String
    let timeConsultationCompleted, dispositionDecisionDate, dispositionDecisionTime, departureDate: String
    let departureTime: String
}



func EncounterJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func EncounterJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? EncounterJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func EncounterTask(with url: URL, completionHandler: @escaping (EncounterResponse?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}
